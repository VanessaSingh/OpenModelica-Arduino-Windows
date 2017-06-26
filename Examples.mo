package Examples
  extends Modelica.Icons.ExamplesPackage;

  package led
    extends Modelica.Icons.ExamplesPackage;

    model led_blue "Turn on Blue LED"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = true);
      Integer digital_out(fixed = true);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
      if ok <> 0 then
        strm.print("Check the serial port and try again");
      else
        sComm.delay(1000);
        digital_out := sComm.cmd_digital_out(1, 9, 1) "This will turn ON the blue LED";
        //sComm.delay(5000);
      end if;
      //strm.print(String(time));
      //when time == 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
    end led_blue;







































    model led_blue_delay "Turn on Blue LED for a period of 2 seconds"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer digital_out(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
//sComm.delay(100);
      if ok <> 0 then
        strm.print("Check the serial port and try again");
      else
        digital_out := sComm.cmd_digital_out(1, 9, 1) "This will turn the blue LED";
        sComm.delay(2000) "let the blue LED be on for two seconds";
        digital_out := sComm.cmd_digital_out(1, 9, 0) "turn off blue LED";
        sComm.delay(2000) "let the blue LED be off for two seconds";
      end if;
      //strm.print(String(time));
      //when time == 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
    end led_blue_delay;


























    model led_blue_red "Turn on Red & Blue LED"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer digital_out(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
//sComm.delay(2000);
      if ok <> 0 then
        strm.print("Check the serial port and try again");
      else
        digital_out := sComm.cmd_digital_out(1, 9, 1) "This will turn the blue LED";
        digital_out := sComm.cmd_digital_out(1, 11, 1) "This will turn the red LED";
        sComm.delay(5000) "Delay for 5 seconds";
        digital_out := sComm.cmd_digital_out(1, 9, 0) "This turns off the blue Led";
        sComm.delay(3000) "Delay for 3 seconds";
        digital_out := sComm.cmd_digital_out(1, 11, 0) "This turns off the red Led";
      end if;
      //strm.print(String(time));
      //when time == 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
    end led_blue_red;








    model led_blink "This will turn on and turn off the user LED for every second for 10 times"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer digital_out(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
      if ok <> 0 then
        strm.print("Check the serial port and try again");
      else
        digital_out := sComm.cmd_digital_out(1, 13, 0) "This will turn off the LED";
        sComm.delay(500) "Delay for 0.5 seconds";
        digital_out := sComm.cmd_digital_out(1, 13, 1) "This turns the Led";
        sComm.delay(500) "Delay for 0.5 seconds";
      end if;
      //when time == 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
    end led_blink;





    model led_green_blink "This will turn on and turn off the green LED for every second for 5 times"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer digital_out(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
//sComm.delay(1000);
      if ok <> 0 then
        strm.print("Check the serial port and try again");
      else
        digital_out := sComm.cmd_digital_out(1, 10, 0) "This will turn off the green LED";
        sComm.delay(1000) "Delay for 1 second";
        digital_out := sComm.cmd_digital_out(1, 10, 1) "This turns the green Led";
        sComm.delay(1000) "Delay for 1 second";
      end if;
      //strm.print(String(time));
      //when time >= 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 2));
    end led_green_blink;











  end led;

  package push
    extends Modelica.Icons.ExamplesPackage;

    model led_push_button "Conrolling LED with PushButton"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer digital_in(fixed = false);
      Integer digital_out(fixed = false);
      //Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
      if ok <> 0 then
        strm.print("Unable to open serial port, please check");
      else
        for i in 1:1000 loop
          digital_in := sComm.cmd_digital_in(1, 12) "";
          if digital_in == 0 then
            digital_out := sComm.cmd_digital_out(1, 9, 0) "This will turn OFF the blue LED";
          else
            digital_out := sComm.cmd_digital_out(1, 9, 1) "This will turn ON the blue LED";
          end if;
        end for;
      end if;
      //strm.print(String(time));
     // when time == 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 1));
    end led_push_button;































    model push_button_status "Checking Status of PushButton"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer digital_in(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
      if ok <> 0 then
        strm.print("Unable to open serial port, please check");
      else
        //for i in 1:1000 loop
          digital_in := sComm.cmd_digital_in(1, 12);
          if digital_in == 0 then
            strm.print("LOW");
          else
            strm.print("HIGH");
          end if;
        //end for;
      end if;
      sComm.delay(500);
//sComm.cmd_arduino_meter(digital_in);
      //when time >= 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 1));
    end push_button_status;



















  end push;

  package ldr
    extends Modelica.Icons.ExamplesPackage;

    model ldr_led ""
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer analog_in(fixed = false);
      Integer digital_out(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
//sComm.delay(1000);
      if ok <> 0 then
        strm.print("Unable to open serial port, please check");
      else
        //for i in 1:500 loop
          analog_in := sComm.cmd_analog_in(1, 5) "read analog pin 5 (ldr)";
          if analog_in < 300 then
            digital_out := sComm.cmd_digital_out(1, 9, 1) "Turn ON LED";
          else
            digital_out := sComm.cmd_digital_out(1, 9, 0) "Turn OFF LED";
          end if;
        //end for;
      end if;
      sComm.delay(500);
//Run for 500 iterations
//Setting Threshold value of 300
//when time >= 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 1));
    end ldr_led;



  
    model ldr_read "Lumino"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer analog_in(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
      if ok <> 0 then
        strm.print("Unable to open serial port, please check");
      else
        analog_in := sComm.cmd_analog_in(1, 5) "read analog pin 5 (ldr)";
        strm.print("LDR Readings at time " + String(time) + " : " + String(analog_in));
        sComm.delay(500);
      end if;
//Run for 20 iterations
//when time >= 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 1));
    end ldr_read;







  end ldr;




  package pot
    extends Modelica.Icons.ExamplesPackage;

    model pot_threshold
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer analog_in(fixed = false);
      Integer digital_out(fixed = false);
      //Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
      if ok <> 0 then
        strm.print("Unable to open serial port, please check");
      else
        for i in 1:10 loop
          analog_in := sComm.cmd_analog_in(1, 2) "read analog pin 2";
          strm.print("Potentiometer Readings:"+ String(time)+"::"+String(analog_in));
          if analog_in >= 0 and analog_in < 320 then
            digital_out := sComm.cmd_digital_out(1, 11, 1) "Turn ON LED";
            sComm.delay(1000);
            digital_out := sComm.cmd_digital_out(1, 11, 0) "Turn OFF LED";
          elseif analog_in >= 320 and analog_in <= 900 then
            digital_out := sComm.cmd_digital_out(1, 10, 1) "Turn ON LED";
            sComm.delay(1000);
            digital_out := sComm.cmd_digital_out(1, 10, 0) "Turn OFF LED";
          elseif analog_in > 900 and analog_in <= 1023 then
            digital_out := sComm.cmd_digital_out(1, 9, 1) "Turn ON LED";
            sComm.delay(1000);
            digital_out := sComm.cmd_digital_out(1, 9, 0) "Turn OFF LED";
          end if;
        end for;
      end if;
//Run for 10 iterations
//Threshold 1
//Threshold 2
      //when time >= 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 0, Tolerance = 1e-6, Interval = 0));
    end pot_threshold;

















  end pot;

  package thermistor
    extends Modelica.Icons.ExamplesPackage;

    model therm_buzzer "Sound buzzer depending on thermistor readings"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer analog_in(fixed = false);
      Integer digital_out(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
      if ok <> 0 then
        strm.print("Unable to open serial port, please check");
      else
        //for i in 1:500 loop
          analog_in := sComm.cmd_analog_in(1, 4) "read analog pin 4";
          if analog_in > 500 then
            digital_out := sComm.cmd_digital_out(1, 3, 1) "Turn ON Buzzer";
          else
            digital_out := sComm.cmd_digital_out(1, 3, 0) "Turn OFF Buzzer";
          end if;
          sComm.delay(500);
        //end for;
      end if;
//Run for 500 iterations
//Setting Threshold value of 500
      //when time >= 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 1));
    end therm_buzzer;












    model therm_read "Thermistor Readings"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer analog_in(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
      if ok <> 0 then
        strm.print("Unable to open serial port, please check");
      else
        //for i in 1:20 loop
          analog_in := sComm.cmd_analog_in(1, 4) "read analog pin 5 (ldr)";
          strm.print("Thermistor Readings at time " + String(time) + " : " + String(analog_in));
          sComm.delay(500);
        //end for;
      end if;
//Run for 20 iterations
      //when time >= 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 1));
    end therm_read;






  end thermistor;


  package dcmotor
    extends Modelica.Icons.ExamplesPackage;

    model dcmotor_clock "Rotate DC Motor clockwise"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "COM port is 2 and baud rate is 115200";
      if ok <> 0 then
        strm.print("Unable to open serial port, please check");
      else
        sComm.delay(1000);
        sComm.cmd_dcmotor_setup(1, 3, 1, 9, 10) "Setup DC motor of type 3 (L293D), motor 1, pin 9 and 10";
        sComm.cmd_dcmotor_run(1, 1, 100) "Motor 1 runs at PWM 100";
        sComm.delay(3000) "This is allowed to continue for 3 seconds";
        sComm.cmd_dcmotor_release(1, 1) "Motor 1 is released";
      end if;
    //when time >= 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
     // end when;
      annotation(
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
    end dcmotor_clock;













    model dcmotor_both "Rotate DC Motor in both directions"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "COM port is 2 and baud rate is 115200";
      if ok <> 0 then
        strm.print("Unable to open serial port, please check");
      else
        sComm.cmd_dcmotor_setup(1, 3, 1, 9, 10) "Setup DC motor of type 3 (L293D), motor 1, pin 9 and 10";
        sComm.cmd_dcmotor_run(1, 1, 100) "Motor 1 runs at PWM 100";
        sComm.delay(3000) "for 3 seconds";
        sComm.cmd_dcmotor_run(1, 1, -100) "Motor 1 runs at PWM -100 in reverse direction";
        sComm.delay(2000) "for 2 seconds";
        sComm.cmd_dcmotor_release(1, 1) "Motor 1 is released";
      end if;
//sComm.delay(5000);
//when time >= 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
    end dcmotor_both;









    model dcmotor_loop "Rotate DC Motor in both directions in a loop"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "COM port is 2 and baud rate is 115200";
      if ok <> 0 then
        strm.print("Unable to open serial port, please check");
      else
        sComm.cmd_dcmotor_setup(1, 3, 1, 9, 10) "Setup DC motor of type 3 (L293D), motor 1, pins 9 and 10";
        //for i in 1:4 loop
          sComm.cmd_dcmotor_run(1, 1, 100) "Motor 1 runs at PWM 100";
          sComm.delay(2000) "for 3 seconds";
          sComm.cmd_dcmotor_run(1, 1, 0) "Halt the motor";
          sComm.delay(2000) "for 2 seconds";
          sComm.cmd_dcmotor_run(1, 1, -100) "Run it at PWM 100 in reverse direction";
          sComm.delay(2000) "for 2 seconds";
        //end for;
        sComm.cmd_dcmotor_release(1, 1) "Motor 1 is released";
      end if;
//when time >= 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 2));
    end dcmotor_loop;










  end dcmotor;

  package servo
    extends Modelica.Icons.ExamplesPackage;

    model servo_init "Rotate Servo Motor "
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "COM port is 2 and baud rate is 115200";
      if ok <> 0 then
        strm.print("Check the serial port and try again");
      else
        sComm.cmd_servo_attach(1, 1) "To attach the motor to pin 9 of servo1";
        sComm.cmd_servo_move(1, 1, 30) "tell servo to rotate by 30 degrees";
        sComm.delay(3000);
        //sComm.cmd_servo_detach(1,1);
      end if;
//when time >= 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 5));
    end servo_init;

















































    model servo_loop "Rotate servo motor by 20 degrees 10 times"
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer c_ok(fixed = false);
      Integer angle(fixed = true);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "COM port is 2 and baud rate is 115200";
      if ok <> 0 then
        strm.print("Check the serial port and try again");
      else
        sComm.cmd_servo_attach(1, 1) "Attach motor to pin 9. 1 means pin 9.";
        sComm.delay(2000);
        angle := 20 "Angle by which it has to move";
        for i in 1:10 loop
          sComm.cmd_servo_move(1, 1, angle * i) "tell servo to rotate by 20 degrees";
          sComm.delay(1000) "waits for a sec";
        end for;
        sComm.cmd_servo_detach(1, 1) "Detach the motor";
      end if;
//when time >= 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 5));
    end servo_loop;








    model servo_reverse
      extends Modelica.Icons.Example;
      import sComm = Arduino.SerialCommunication.Functions;
      
      import strm = Modelica.Utilities.Streams;
      Integer ok(fixed = false);
      Integer c_ok(fixed = false);
    algorithm
      ok := sComm.open_serial(1, 2, 115200) "COM port is 2 and baud rate is 115200";
      if ok <> 0 then
        strm.print("Check the serial port and try again");
      else
        sComm.cmd_servo_attach(1, 1) "Attach the motor to pin 9. 1 means 9";
        sComm.cmd_servo_move(1, 1, 90) "Move the servo to 90 degree";
        sComm.delay(1000) "be there for one second";
        sComm.cmd_servo_move(1, 1, 45) "Move the servo to 45 degree";
        sComm.delay(1000) "be there for one second";
        sComm.cmd_servo_detach(1, 1) "Detach the motor";
        sComm.delay(1000);
      end if;
//when time >= 10 then
        c_ok := sComm.close_serial(1) "To close the connection safely";
      //end when;
      annotation(
        experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 5));
    end servo_reverse;







model servo_pot "Control Servo Motor using Potentiometer"
extends Modelica.Icons.Example;
import sComm = Arduino.SerialCommunication.Functions;

import strm = Modelica.Utilities.Streams;
Integer ok(fixed = false);
Integer c_ok(fixed = false);
Integer analog_in(fixed = false);
algorithm
ok := sComm.open_serial(1, 2, 115200) "COM port is 2 and baud rate is 115200";
if ok <> 0 then
strm.print("Check the serial port and try again");
else
sComm.cmd_servo_attach(1, 1) "Attach the motor to pin 9";
sComm.delay(2000);
//for i in 1:5000 loop
  analog_in := sComm.cmd_analog_in(1, 2) "Read potentiometer value";
  sComm.cmd_servo_move(1, 1, analog_in) "Command the servo motor";
  sComm.delay(500) "sleep for 500 milliseconds";
//end for;
sComm.cmd_servo_detach(1, 1) "Detach the motor";
end if;
//5,000 itterations
analog_in := sComm.math_floor(analog_in * (180 / 1023)) "Scale Potentiometer value to 0-180";
//strm.print(String(analog_in));
//when time >= 10 then
c_ok := sComm.close_serial(1) "To close the connection safely";
//end when;
annotation(
experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 5));
end servo_pot;















  end servo;

  package modbus
    extends Modelica.Icons.ExamplesPackage;

    function read_voltage
      extends Modelica.Icons.Function;
    
      external read_voltage() annotation(
        Library = "/home/souradip/OpenModelica/Modbus.so",
        LibraryDirectory = "/home/souradip/OpenModelica",
        Include = "#include \"/home/souradip/OpenModelica/headers/modbus.h\"");
      annotation(
        Documentation(info = "<html>
    <h4>Syntax</h4>
    <blockquote><pre>
    Arduino.SerialCommunication.Examples.modbus.<b>read_voltage</b>();
    </pre></blockquote>
    <h4>Description</h4>
    <p>
    </p>
    </html>"));
    end read_voltage;



    function read_current
      extends Modelica.Icons.Function;
    
      external read_voltage() annotation(
        Library = "/home/souradip/OpenModelica/Modbus.o",
        LibraryDirectory = "/home/souradip/OpenModelica",
        Include = "#include \"/home/souradip/OpenModelica/headers/modbus.h\"");
      annotation(
        Documentation(info = "<html>
    <h4>Syntax</h4>
    <blockquote><pre>
    Arduino.SerialCommunication.Examples.modbus.<b>read_current</b>();
    </pre></blockquote>
    <h4>Description</h4>
    <p>
    </p>
    </html>"));
    end read_current;

    function read_val
      extends Modelica.Icons.Function;
      input Integer addr_byte;
      output Real p;
    
      external p = read_val(addr_byte) annotation(
        Library = "/home/souradip/OpenModelica/Modbus.o",
        LibraryDirectory = "/home/souradip/OpenModelica",
        Include = "#include \"/home/souradip/OpenModelica/headers/modbus.h\"");
      annotation(
        Documentation(info = "<html>
    <h4>Syntax</h4>
    <blockquote><pre>
    Arduino.SerialCommunication.Examples.modbus.<b>read_val</b>(address_byte);
    </pre></blockquote>
    <h4>Description</h4>
    <p>
    </p>
    </html>"));
    end read_val;

    function read_active_power
      extends Modelica.Icons.Function;
    
      external read_active_power() annotation(
        Library = "/home/souradip/OpenModelica/Modbus.o",
        LibraryDirectory = "/home/souradip/OpenModelica",
        Include = "#include \"/home/souradip/OpenModelica/headers/modbus.h\"");
      annotation(
        Documentation(info = "<html>
    <h4>Syntax</h4>
    <blockquote><pre>
    Arduino.SerialCommunication.Examples.modbus.<b>read_active_power</b>();
    </pre></blockquote>
    <h4>Description</h4>
    <p>
    </p>
    </html>"));
    end read_active_power;
  end modbus;
end Examples;
