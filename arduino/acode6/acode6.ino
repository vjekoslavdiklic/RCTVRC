/*                      ARDUINO NANO:
                     ____________________
                    -|       ICSP       |
                    -|TX1 (01)       VIN|-
                    -|RX0 (00)       GND|-
                    -|RST            RST|-
                    -|GND            +5V|-
speed sensor        -|D2  (02)        A7|-
forwardpin          -|D3  (03)        A6|-
speed sensor        -|D4  (04)        A5|-
                    -|D5  (05)        A4|-
                    -|D6  (06)  (19)  A3|-
                    -|D7  (07)  (18)  A2|-
                    -|D8  (08)  (17)  A1|-
                    -|D9  (09)  (16)  A0|- CURRENT SENSOR INPUT (ANALOG)
                    -|D10 (10)  (15) REF|- TO +5V
backwardpwm         -|D11 (11)  (14) 3V3|-
STATUS_LED_PIN      -|D12 (12)  (13) D14|-
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


//TIMER SETTINGS
float timesample=0.01;  // in sec, default 0.9
#define timer_interval timesample*1000000
#define encoder_holes 5 //NUMBER OF HOLES IN ENCODER WHEEL

//SERIAL SETTINGS
#define BAUD_RATE 1000000
#define currange 10 //curent sensor range from -5A to +5A

// GLOBAL VARIABLES:
int lsttime=0;     //VARIABLE USED FOR MESSUREING TIME BETWEEN TWO ENCODER PULSES
volatile int LED_ON;        //VARIABLE FOR LED STATUS USED FOR DEBUGGING
unsigned int cnt=0;       // VARIABLE FOR COUNTING SPEED SENSORS INPUTS
volatile  float cur=0;      // VARIABLE FOR current
double spd=0;      //VARIABLE FOR STORING LAST SPEED 
char sdatain[2];            //1X2 ARRAY FOR INCOMING SERIAL DATA
//volatile char parritybayte; // USE THESE FOR ERROR CORRECTION IN SERIAL COMMUNICATION 
double Td;
//unsigned int Tc;
unsigned int Timer1_overflow=0;
unsigned int S1;
double aaaa;

//PIN SETTINGS:
#define forwardpin  3 
#define backwardpin  11
#define interruptPin  2   
#define currentpin 15
#define STATUS_LED_PIN 12
//#define S1 2
#define Tc 0.01
#define T1OCA_reg Tc*16000000/8

void setup() 

{  
  
  //TIMER 0
  TCCR0A = 0;
  TCCR0B = 0;
  TCNT0 = 0;            
  TCCR0B = B00000111; //external clock
  TIMSK0=B0000111;
  OCR0A=255;//detekcija preljeva
 // TIMSK0 = B00000000;   // enable interupts on OCEIA

  // TIMER 1
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1 = 0;            
  TCCR1B= B00000011;    //clock/8
  OCR1A=T1OCA_reg;// 0.01s
  TIMSK1=B00000011;
  
  
  //pin setup:
  pinMode(4,INPUT_PULLUP);
  pinMode(forwardpin, OUTPUT);
  pinMode(backwardpin, OUTPUT);
  pinMode(STATUS_LED_PIN, OUTPUT); //test pin
  pinMode(currentpin,INPUT);
  analogReference(EXTERNAL);

  // motor is standstill and start   
  analogWrite(forwardpin,0);
  analogWrite(backwardpin,0);
  
  //open serial port
  Serial.begin(BAUD_RATE);

  sei(); //ENABLE ALL INTERUPST
 
}

//LED BLINKER FOR DEBUG
void debugblink()
{
    if(LED_ON==0){digitalWrite(STATUS_LED_PIN, HIGH);LED_ON++;}
    else if(LED_ON==1){digitalWrite(STATUS_LED_PIN, LOW);LED_ON=0;}
}



ISR(TIMER0_COMPB_vect)
{   
  //Serial.println('a');
  //noInterrupts();
  Td=TCNT1;
  Td=Td;//+Timer1_overflow*65535;
  Timer1_overflow=0;
  //Serial.println(Td,6);
  //Serial.println(cnt);
  spd=(60*cnt)/(encoder_holes*Td);
  spd=spd*2000000;
  //Serial.println(spd);
  cnt=0;
  TCNT1=0;
  TCNT0=0;
  TIMSK0=B0000011;
  //interrupts(); 
}

//TIMER1 INTERUPPT FUNCTION
ISR(TIMER1_COMPA_vect)// 5 pri isteku Tc
{
 Serial.println(TCNT0);
 cnt=TCNT0;
 OCR0B=TCNT0+1;
 TIMSK0=B0000111;
 //Serial.println(TCNT0);

 
 //cur=(float)analogRead(currentpin); //READ ANALOG VALUE ON CURRENT SENSOR
 //cur=(cur/(float)1023)*currange-currange/2; //CALCULATE REAL CURRENT IN AMPERS
 //OCR1B=TCNT1;
}

//TIMER1 INTERUPPT FUNCTION
ISR(TIMER1_OVF_vect)// 5 IMPULSES FORM SENSOR
{
Timer1_overflow++;
}


ISR(TIMER0_COMPA_vect)// 5 IMPULSES FORM SENSOR
{
 Serial.println('c');
}



//PRINT FUNCTION USED FOR TESTING CALL IT FROM void loop
void senddata(){
  
  Serial.write('\r');
  Serial.print(spd,DEC);
  
  Serial.write('\r');
  Serial.println(cur);
  Serial.write('\n');    
}

// MAIN LOOP FUNCTION:
void loop(){

  //senddata(); //CONSTATLY SEND STATUS TO PC ONLY FOR DEBUGGING
// MAIN LOOP IS EMPTY.
}



// SERIAL INTERUPT FUNCTION:
void serialEvent() 
{
  
// READ NEW DATA:   
  while (Serial.available()) 
  {
    Serial.readBytesUntil('\n', sdatain, sizeof(sdatain) / sizeof(char) );
  }
    //CHANGE PWM VALUES
    analogWrite(forwardpin,sdatain[0]);  //SETTING PWM VALUE
    analogWrite(backwardpin,sdatain[1]); //SETTING PWM VALUE
    
    // SEND TO PC:     
    Serial.write(sdatain[0]); //LAST SATUS FOR FORWARD 
    Serial.write(sdatain[1]); //LAST STATUS FOR BACKWARD
    Serial.write('\r'); // PRINT /r ON SERIAL 
    Serial.print(cur,6); // MASSURE AND SEND CURRENT cur
    Serial.write('\r');// PRINT /r ON SERIAL   
    Serial.print(spd); // NUMBER OF COUNTED INTERUPTS OF SPEED SENSOR. THESE NEEDS TO BE REPLACED WITH ACTUAL SPEED: 
    Serial.write('\n');// END TRANSMISSION SIMBOL   
  }

  


 
