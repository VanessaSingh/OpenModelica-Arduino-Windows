#!/bin/bash
clear
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 port baudrate" >&2
  exit 1
fi

re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
   echo "error: $1 -> Not a number" >&2; exit 1
fi

if ! [[ $2 =~ $re ]] ; then
   echo "error: $2-> Not a number" >&2; exit 1
fi

b_rate=$2

present=`pwd`
unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
	mdd_path=($(locate Modelica_DeviceDrivers/Modelica_DeviceDrivers/Resources/Include))
	om_path=($(locate /usr/include/omc/c))
	port="/dev/ttyACM$1"
	omc --simCodeTarget=ExperimentalEmbeddedC runMDD_ldr_read.mos
	if [ $? -ne 0 ]; then
		exit 1
	fi
	avr-gcc -Os -std=c11 -ffunction-sections -fdata-sections -mmcu=atmega328p -DF_CPU=16000000UL -Wl,--gc-sections ldr_read_main.c -o ldr_read -I${mdd_path[0]} -I${path_to_om} -I${path_to_mdd} -I${om_path[0]}  
	if [ $? -ne 0 ]; then
		exit 1
	fi
	avr-objcopy -O ihex -R .eeprom ldr_read ldr_read.hex
	if [ $? -ne 0 ]; then
		exit 1
	fi 
	avrdude -F -V -c arduino -p ATMEGA328P -P $port -b $b_rate -U flash:w:ldr_read.hex
	if [ $? -ne 0 ]; then
		exit 1
	fi
else
	cd c:	
	om_path=($(dir -d OpenModelica*/include/omc/c/))
	path_to_om="C:/$om_path"
	cd f:
	mdd_path=($(dir -d */Modelica_DeviceDrivers/Modelica_DeviceDrivers/Resources/Include/))
	if [ $? -eq 0 ]; then
		path_to_mdd="F:/$mdd_path"
	else
		exit 1
	fi
	
	port="COM$1"
	cd $present
	omc --simCodeTarget=ExperimentalEmbeddedC run_ldr_read.mos
	if [ $? -ne 0 ]; then
		exit 1
	fi

	avr-gcc -Os -std=c11 -ffunction-sections -fdata-sections -mmcu=atmega328p -DF_CPU=16000000UL -Wl,--gc-sections -I${path_to_om} -I${path_to_mdd} MDD_ldr_read_main.c -o MDD_ldr_read   
	if [ $? -ne 0 ]; then
		exit 1
	fi
	avr-objcopy -O ihex -R .eeprom MDD_ldr_read MDD_ldr_read.hex
	if [ $? -ne 0 ]; then
		exit 1
	fi 
	avrdude -F -V -c arduino -p ATMEGA328P -P $port -b $b_rate -U flash:w:MDD_ldr_read.hex
	if [ $? -ne 0 ]; then
		exit 1
	fi
fi

