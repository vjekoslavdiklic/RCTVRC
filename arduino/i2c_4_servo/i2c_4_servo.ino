/* Sweep
 by BARRAGAN <http://barraganstudio.com>
 This example code is in the public domain.

 modified 8 Nov 2013
 by Scott Fitzgerald
 http://www.arduino.cc/en/Tutorial/Sweep
*/
#include <Servo.h>
#include <Wire.h>
#define SLAVE_ADDRESS 0x09 //I2C slave address

#define BAUD_RATE 9600
#define DEBUG 1


//Servo myservo0;  // create servo object to control a servo
//Servo myservo1;  // create servo object to control a servo
//Servo myservo2;  // create servo object to control a servo
//Servo myservo3;  // create servo object to control a servo
//char sdatain[4]; 
char wdatain[5];            //1X2 ARRAY FOR INCOMING SERIAL DATA
//int servo_data[4];
//int servo_data_old[4];

// twelve servo objects can be created on most boards

//int pos = 0;    // variable to store the servo position

void setup() {
  
  //WDTCSR |= _BV(WDIE);
  //wdt_enable(WDTO_1S);
  
  Wire.begin(SLAVE_ADDRESS); //start I2C  
  Wire.onReceive(receiveData); //define recive function
//  Wire.onRequest(sendData); //define send function


  if(DEBUG){Serial.begin(BAUD_RATE);}
   
  //myservo0.attach(3);  // attaches the servo on pin 9 to the servo object
  //myservo1.attach(5);  // attaches the servo on pin 9 to the servo object
  //myservo2.attach(6);  // attaches the servo on pin 9 to the servo object
  //myservo3.attach(9);  // attaches the servo on pin 9 to the servo object


}




void receiveData(int byteCount){
while(Wire.available()) {

Wire.readBytesUntil('\n',wdatain, sizeof(wdatain) / sizeof(char) );




}
Serial.print("s0:");
Serial.println(wdatain[0]);
Serial.print("s1:");
Serial.println(wdatain[1]);
Serial.print("s2:");
Serial.println(wdatain[2]);
Serial.print("s3:");
Serial.println(wdatain[3]);

}

// callback for sending data
void sendData(){
//Serial.println("sending");
//Wire.write("long_string_to_fill_a_buffer");
//Wire.write('a');
//Wire.print('_');
//Wire.println();
// delay(1000);
//Wire.write((byte)flt);
// Wire.write(nus);
//Wire.write('_');// PRINT /r ON SERIAL   
//Wire.write('b'); // NUMBER OF COUNTED INTE
}




void loop() {
  //wdt_enable(WDTO_120MS);
  //wdt_reset();
       // tell servo to go to position in variable 'pos'
Serial.println("main_loop");
delay(1000);
}

