/*                      ARDUINO NANO:
                     ____________________
                    -|       ICSP       |
                    -|TX1 (01)       VIN|-
                    -|RX0 (00)       GND|-
                    -|RST            RST|-
                    -|GND            +5V|-
speed sensor        -|D2  (02)        A7|-
                    -|D3  (03)        A6|-
                    -|D4  (04)        A5|-
        forwardpin  -|D5  (05)        A4|-
       backwardpwm  -|D6  (06)  (19)  A3|-
                    -|D7  (07)  (18)  A2|-
                    -|D8  (08)  (17)  A1|-
                    -|D9  (09)  (16)  A0|- CURRENT SENSOR INPUT
                    -|D10 (10)  (15) REF|- TO +5V
                    -|D11 (11)  (14) 3V3|-
                    -|D12 (12)  (13) D14|-
                     |_______USB________|
                           |to PC|
                            |   |
 */
 
/*
 * MOTOR DRIVER INFO: http://www.hessmer.org/blog/2013/12/28/ibt-2-h-bridge-with-arduino/
 * 
 * TO DRIVE MOTOR FORWARD:
 * SET backwardpwm=0 
 * SET forwardpwm=0<->255
 * 
 * TO DRIVE MOTOR BACKWARD:
 * SET forwardpwm=0
 * SET backwardpwm=0<->255
 * 
 * SLOW STOP:
 * SET forwardpwm=0
 * SET backwardpwm=0 
 * 
 * BREAKING:
 * BREAKING IS ACHIVED BY 
 * REVRSING CURRENT DIRECTION UNTIL STOP
 * 
 * NOTE:
 * THE backwardpwm AND forwardpwm CAN NOT HAVE VALUES IN SAME TIME
 * ONE OF THEM SHULD ALWAYS HAVE VALUE ZERO.
 */

 /*
  * speed sensor info : https://www.myxlshop.co.uk/j-s-2-speed-measurement-sensor-module-for-arduino.html
  */

  /*
   * current sensor info :http://www.allegromicro.com/~/media/Files/Datasheets/ACS712-Datasheet.ashx 
   */

// TO TEST SERIAL COMUNICATION USE REALTERM https://sourceforge.net/projects/realterm/


   
#include "TimerOne.h" ADRUINO LIBRARY FOR USING ARDUINOS TIMERS... USE THESE FOR SPEED MASSURE.
//TIMER SETTINGS
#define timesample 0.01  // in sec, default 0.9
#define timer_interval timesample*1000000
#define encoder_holes 5 //NUMBER OF HOLES IN ENCODER WHEEL

//SERIAL SETTINGS
#define BAUD_RATE 1000000
#define currange 10 //curent sensor range from -5A to +5A

// GLOBAL VARIABLES:
//*volatile int lsttime=0; //VARIABLE USED FOR MESSUREING TIME BETWEEN TWO ENCODER PULSES
volatile int LED_ON; //VARIABLE FOR LED STATUS USED FOR DEBUGGING
volatile float cnt=0; // VARIABLE FOR COUNTING SPEED SENSORS INPUTS
volatile  float cur=0; // VARIABLE FOR current
volatile  float spd=0; //VARIABLE FOR STORING LAST SPEED 
char sdatain[2]; //1X2 ARRAY FOR INCOMING SERIAL DATA
volatile char parritybayte; // USE THESE FOR ERROR CORRECTION IN SERIAL COMMUNICATION 

//PIN SETTINGS:
int forwardpin = 5; 
int backwardpin = 6;
int interruptPin = 2;   
int currentpin=14;


// INTERRUPT FUNCTION FOR EACH TIME SPEED SENSOR DETECT A HOLE
void intfun() {
  detachInterrupt(digitalPinToInterrupt(interruptPin)); //TEMPORARY DISABLE INTERUPTS
  cnt++; // INCREESE COUNTER NUMBER 
  //*lsttime=TCNT2;  //scaling is missing 
  //*TCNT2=0;
  attachInterrupt(digitalPinToInterrupt(interruptPin), intfun , FALLING); //REANABLE INTERUPTS
  }

  
// SETUP FUNCTION, these runs only ones before program starts.

void setup() 
{  
  // interrupt setup:  
  pinMode(interruptPin, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(interruptPin), intfun , FALLING);
  
  //pin setup:
  pinMode(forwardpin, OUTPUT);
  pinMode(backwardpin, OUTPUT);
  pinMode(12, OUTPUT); //test pin

  // motor is standstill and start   
  analogWrite(forwardpin,0);
  analogWrite(backwardpin,0);
  
  //open serial port
  Serial.begin(BAUD_RATE);
 
  //timer1 setup
  Timer1.initialize(timer_interval);         // initialize timer1, and set a 1/2 second period
  Timer1.attachInterrupt(timerint);  // attaches callback() as a timer overflow interrupt


  // timer2 setup_________________________________________________________________________________________
  //*TCCR2A = 0;
  //*TCCR2B = B00000111;//clock/1024
  //*TCNT2  = 0; //timer courent value

  //*OCR2A = 0;            // compare match register 16MHz/256/2Hz
  //*OCR2B = 0;
  //TCCR2B |= (1 << WGM12);   // CTC mode
  //TCCR2B |= (1 << CS12);    // 256 prescaler 
  //TIMSK2 |= (1 << OCIE1A);  // enable timer compare interrupt
}


//LED BLINKER FOR DEBUG
void debugblink()
{
    if(LED_ON==0){digitalWrite(12, HIGH);LED_ON++;}
    else if(LED_ON==1){digitalWrite(12, LOW);LED_ON=0;}
}


 //TIMER INTERUPPT FUNCTION  
  void timerint()
{
  detachInterrupt(digitalPinToInterrupt(interruptPin)); //TEMPORARY DISABLE INTERUPTS
  debugblink();// FOR DEBUGGING EACH TIME TIMER COUTNS UP THE LED ON D12 BLINK
  spd=cnt/timesample*60/(encoder_holes*4); //READ SPEED COUNTER STATUS
  cnt=0;//RESET SPEED COUNTER STATUS
  cur=(float)analogRead(currentpin); //READ ANALOG VALUE ON CURRENT SENSOR
  cur=cur/(float)1023*currange-currange/2; //CALCULATE REAL CURRENT IN AMPERS
  attachInterrupt(digitalPinToInterrupt(interruptPin), intfun , FALLING); //REENABLE INTERUPTS
}


//PRINT FUNCTION USED FOR TESTING CALL IT FROM void loop
void senddata(){
  Serial.print(cur,DEC); 
  Serial.write('\r');
  Serial.print(spd,DEC);
  
  //Serial.write('\r');
     // Serial.print(lsttime);
  Serial.write('\n');    
}

// MAIN FUNCTION:
void loop(){
  //senddata(); //CONSTATLY SEND STATUS TO PC ONLY FOR DEBUGGING
// MAIN LOOP IS EMPTY BY DEFAULT.
}


// SERIAL INTERUPT FUNCTION:
void serialEvent() 
{
// READ NEW DATA:   
  while (Serial.available()) 
  {   Serial.readBytesUntil('\n', sdatain, sizeof(sdatain) / sizeof(char) );
  }
    // SEND TO PC:   
    analogWrite(forwardpin,sdatain[0]);  //SETTING PWM VALUE
    analogWrite(backwardpin,sdatain[1]); //SETTING PWM VALUE
    Serial.write(sdatain[0]); //LAST SATUS FOR FORWARD 
    Serial.write(sdatain[1]); //LAST STATUS FOR BACKWARD
    Serial.write('\r'); // PRINT /r ON SERIAL 
    Serial.print(cur,6); // MASSURE AND SEND CURRENT cur
    Serial.write('\r');// PRINT /r ON SERIAL
    //if(spd){ 
    Serial.print(spd,6); // NUMBER OF COUNTED INTERUPTS OF SPEED SENSOR. THESE NEEDS TO BE REPLACED WITH ACTUAL SPEED: 
    //}
    //else {
       //*Serial.write('\r');
      //*Serial.print(lsttime);
      //}
    Serial.write('\n');// END TRANSMISSION SIMBOL    
  }

  


 
