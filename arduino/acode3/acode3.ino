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


// GLOBAL VARIABLES:
volatile int LED_ON; //VARIABLE FOR LED STATUS USED FOR DEBUGGING
volatile unsigned int cnt=0; // VARIABLE FOR COUNTING SPEED SENSORS INPUTS
volatile  float cur=0; // VARIABLE FOR current
volatile unsigned int spd=0; //VARIABLE FOR STORING LAST SPEED 
volatile int speedstatus=0; // VARIABLE FOR SPEED 
char sdatain[2]; //1X2 ARRAY FOR INCOMING SERIAL DATA
volatile char parritybayte; // USE THESE FOR ERROR CORRECTION IN SERIAL COMMUNICATION 

//PIN SETTINGS:

int forwardpin = 5; 
int backwardpin = 6;
int interruptPin = 2;   
int currentpin=14;

//TIMER SETTINGS
#define timesample 0.09  // in sec 
#define timer_interval timesample*1000000
#define encoder_holes 2 //NUMBER OF HOLES IN ENCODER WHEEL

//SERIAL SETTINGS
#define BAUD_RATE 1000000
#define currange 60 //curent sensor range -30 +30

// INTERRUPT FUNCTION
void intfun() {
  detachInterrupt(digitalPinToInterrupt(interruptPin));
  cnt++;
  attachInterrupt(digitalPinToInterrupt(interruptPin), intfun , FALLING);
  }

  
// SETUP FUNCTION, these runs only ones before program starts.

void setup() {
  
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
 
  //timer setup
  Timer1.initialize(timer_interval);         // initialize timer1, and set a 1/2 second period
  //Timer1.pwm(9, 512);                // setup pwm on pin 9, 50% duty cycle
  Timer1.attachInterrupt(timerint);  // attaches callback() as a timer overflow interrupt


               
}
//LED BLINKER FOR DEBUG
void debugblink(){
    if(LED_ON==0){digitalWrite(12, HIGH);LED_ON++;}
  else if(LED_ON==1){digitalWrite(12, LOW);LED_ON=0;}
}


 //TIMER INTERUPPT FUNCTION
  
  void timerint()
{
  detachInterrupt(digitalPinToInterrupt(interruptPin));
  debugblink();// FOR DEBUGGING
  spd=cnt/timesample*60/(encoder_holes*4);
  cnt=0;
  cur=(float)analogRead(currentpin);
  cur=cur/(float)1023*currange-currange/2;
  attachInterrupt(digitalPinToInterrupt(interruptPin), intfun , FALLING);
}


//PRINT FUNCTION USED FOR TESTING 
void senddata(){
  
    Serial.print(cur,DEC); 
  Serial.print("_");
  Serial.print(spd,DEC);
   Serial.write('\r');
    Serial.write('\n');

    
}

// MAIN FUNCTION:
void loop(){
//senddata(); // use for debuging
//________________________________________________________________________________________________________________________________________***NEED CHANGE  
// MAIN LOOP IS EMPTY AT THE MOMENT.
//________________________________________________________________________________________________________________________________________  
}

// SERIAL INTERUPT FUNCTION:
void serialEvent() 
{
// READ NEW DATA: 
  
  while (Serial.available()) 
  {   Serial.readBytesUntil('\n', sdatain, sizeof(sdatain) / sizeof(char) );
      //sdatain[0]= Serial.read();
      //sdatain[1]= Serial.read();
   //________________________________________________________________________________________________________________________________________***NEED CHANGE
      // NEED TO ADD PARITY BAYT FOR ERROR CORRECTION
   //________________________________________________________________________________________________________________________________________
  
  }
  
  //__________________________________________________________________________________________________________________________________________***NEED CHANGE
  // SET NEW DATE TO OUTPUT:
    //NO_ERROR_IN_NEW_DATE=*CHECK IS THERE AN ERROR !
    //if (NO_ERROR_IN_NEW_DATA){
  //__________________________________________________________________________________________________________________________________________   
    analogWrite(forwardpin,sdatain[0]);  //SETTING PWM VALUE
    analogWrite(backwardpin,sdatain[1]); //SETTING PWM VALUE
    
    //}


// SEND TO PC:

    Serial.write(sdatain[0]); //LAST SATUS FOR FORWARD 
    Serial.write(sdatain[1]); //LAST STATUS FOR BACKWARD
    //_________________________________________________________________________________________________________________________________________***NEED CHANGE
    //IF(NO_ERROR_IN_NEW_DATA){
    //Serial.write(255); //LAST STATUS
    //}
    //ELSE{
    //Serial.write(0); //LAST STATUS
    //}    
    //_________________________________________________________________________________________________________________________________________
    Serial.write('\r');
    Serial.print(cur); // MASSURE AND SEND CURRENT cur
    Serial.write('\r');
    //_________________________________________________________________________________________________________________________________________***NEED CHANGE
    Serial.print(spd); // NUMBER OF COUNTED INTERUPTS OF SPEED SENSOR. THESE NEEDS TO BE REPLACED WITH ACTUAL SPEED: 
    //Serial.print(speedstatus,DEC);
    //_________________________________________________________________________________________________________________________________________
    // END OF LINE :
    //Serial.write('\r');
    Serial.write('\n');
    
  }

  


 
