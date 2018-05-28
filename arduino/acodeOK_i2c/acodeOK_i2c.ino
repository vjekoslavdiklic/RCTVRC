/*                      ARDUINO NANO:
                     ____________________
                    -|       ICSP       |
                    -|TX1 (01)       VIN|-
                    -|RX0 (00)       GND|-
                    -|RST            RST|-
                    -|GND            +5V|-
speed sensor        -|D2  (02)        A7|-
forwardpin          -|D3  (03)        A6|-
speed sensor        -|D4  (04)        A5|-  I2C(SCL)
                    -|D5  (05)        A4|-  I2C(SDA)
                    -|D6  (06)  (19)  A3|-
                    -|D7  (07)  (18)  A2|-
                    -|D8  (08)  (17)  A1|-  CURRENT SENSOR INPUT (ANALOG)
                    -|D9  (09)  (16)  A0|- 
                    -|D10 (10)  (15) REF|-  TO +5V
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
#include <Wire.h>

#define SLAVE_ADDRESS 0x20 //I2C slave address
int i2ctest=0; // var used for reseteing pwm rate in case of cutof 
int number = 0; //i2c testvar
char nus[]={10,20,30,40};
float flt=12345.6789;
float flt1=-0.017801;


#define BAUD_RATE 1000000
#define Tc 0.02
#define T1OCA_reg Tc*16000000/8
#define Timmer0_ext 4
#define encoder_holes 20 //NUMBER OF HOLES IN ENCODER WHEEL
#define currange 10 //curent sensor range from -5A to +5A

//PIN SETTINGS:
#define forwardpin  3 
#define backwardpin  11
#define interruptPin  2   
#define currentpin 21
#define STATUS_LED_PIN LED_BUILTIN



unsigned int timer1_ovf=0;
double S1=0;
double Td=0;
double spd=0;
char sdatain[2];            //1X2 ARRAY FOR INCOMING SERIAL DATA
char wdatain[3];            //1X2 ARRAY FOR INCOMING SERIAL DATA
volatile  float cur=0;      // VARIABLE FOR current


typedef struct processData{
  float s_cur;
  float s_rpm;
};

typedef union I2C_Send{
  processData data;
  byte I2C_packet[sizeof(processData)];
};

I2C_Send send_info;

void setup(){
  //I2C settings
  Wire.begin(SLAVE_ADDRESS); //start I2C  
  Wire.onReceive(receiveData); //define recive function
  Wire.onRequest(sendData); //define send function


//Timer1 setup 16bit
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1 = 0;            
  TCCR1B= B00000010;    //clock/8
  OCR1A=T1OCA_reg;// 0.01s
  TIMSK1=B00000011; //BxxxxxBAO

//Timer0 setup 8bit
  TCCR0A = 0;
  TCCR0B = 0;
  TCNT0 = 0;            
  TCCR0B = B00000111; //external clock
  TIMSK0=B0000000; //BxxxxxBAO

//open serial port
  //Serial.begin(BAUD_RATE);

//pinmode configuration
pinMode(Timmer0_ext,INPUT_PULLUP);
pinMode(forwardpin, OUTPUT);
pinMode(backwardpin, OUTPUT);
pinMode(STATUS_LED_PIN, OUTPUT); //test pin
pinMode(currentpin,INPUT);

//analog configuration
analogReference(INTERNAL);
analogRead(currentpin);// first read for setting reference 

//enable interupts
interrupts();   
  
}

ISR(TIMER1_OVF_vect){ //TIMER1 OVERFLOW  // Timer 1 overflow
  timer1_ovf++;
  if(timer1_ovf>10){  spd=0;
  }
  }

  ISR(TIMER1_COMPA_vect) // Tc TRIGGERED // Timer 1 - fiksni period istekao
{
  S1=TCNT0;
  TIMSK1=B00000001;
  OCR0A=S1+1;
  TIMSK0=B00000010;
  
  //timer1_ovf++;
  //Serial.println(":D");
  }


  ISR(TIMER0_COMPA_vect) // TD TRIGGERED // Timer 0 - Broji impulse
{
  //timer1_ovf++;
  //Serial.println("a");
  Td=TCNT1+timer1_ovf*65536;
  timer1_ovf=0;
  TCNT0=0;
  TCNT1=0;  
  TIMSK0=B00000000;
  TIMSK1=B00000011;
  spd=60*2000000*(S1+1)/(encoder_holes*Td);

//  cur=(float)analogRead(currentpin); //READ ANALOG VALUE ON CURRENT SENSOR
//  cur=(cur/(float)1023)*currange-currange/2; //CALCULATE REAL CURRENT IN AMPERS
  digitalWrite(STATUS_LED_PIN, digitalRead(STATUS_LED_PIN) ^ 1);   // toggle LED pin  
  }

/*
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
    //Serial.write(sdatain[0]); //LAST SATUS FOR FORWARD 
    //Serial.write(sdatain[1]); //LAST STATUS FOR BACKWARD
    //Serial.write('\n'); // PRINT /r ON SERIAL 
    Serial.print(cur,6); // MASSURE AND SEND CURRENT cur
    Serial.write('_');// PRINT /r ON SERIAL   
    Serial.println(spd,6); // NUMBER OF COUNTED INTERUPTS OF SPEED SENSOR. THESE NEEDS TO BE REPLACED WITH ACTUAL SPEED: 
    //Serial.write('\n');// END TRANSMISSION SIMBOL   
  }

*/

void receiveData(int byteCount){
while(Wire.available()) {
Wire.readBytesUntil('\n', wdatain, sizeof(wdatain) / sizeof(char) );
//Serial.write(wdatain[0]);
//Serial.write(wdatain[1]);
//Serial.write(wdatain[2]);
//Serial.println();
analogWrite(forwardpin,wdatain[1]);  //SETTING PWM VALUE
analogWrite(backwardpin,wdatain[2]); //SETTING PWM VALUE


//i2c_test++;// use for safy cut off


if (number == 1){
digitalWrite(STATUS_LED_PIN, digitalRead(STATUS_LED_PIN) ^ 1);
}
}
}

// callback for sending data
void sendData(){
cur=(float)analogRead(currentpin); //READ ANALOG VALUE ON CURRENT SENSOR
cur=(cur/(float)1023)*currange-currange/2; //CALCULATE REAL CURRENT IN AMPERS
Wire.print(cur,4);
Wire.print('_');
Wire.println(spd,2);
// delay(1000);
//Wire.write((byte)flt);
// Wire.write(nus);
//Wire.write('_');// PRINT /r ON SERIAL   
//Wire.write('b'); // NUMBER OF COUNTED INTE
}


void loop(){
  
}
