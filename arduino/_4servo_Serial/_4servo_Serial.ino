/* Sweep
 by BARRAGAN <http://barraganstudio.com>
 This example code is in the public domain.

 modified 8 Nov 2013
 by Scott Fitzgerald
 http://www.arduino.cc/en/Tutorial/Sweep
*/

#include <Servo.h>


#define BAUD_RATE 1000000

Servo myservo0;  // create servo object to control a servo
Servo myservo1;  // create servo object to control a servo
Servo myservo2;  // create servo object to control a servo
Servo myservo3;  // create servo object to control a servo
char sdatain[4]; 

// twelve servo objects can be created on most boards

int pos = 0;    // variable to store the servo position

void setup() {
  Serial.begin(BAUD_RATE);
   
  myservo0.attach(3);  // attaches the servo on pin 9 to the servo object
  myservo1.attach(5);  // attaches the servo on pin 9 to the servo object
  myservo2.attach(6);  // attaches the servo on pin 9 to the servo object
  myservo3.attach(9);  // attaches the servo on pin 9 to the servo object

}

// SERIAL INTERUPT FUNCTION:
void serialEvent() 
{
   while (Serial.available()) 
  {
    Serial.readBytesUntil('\n', sdatain, sizeof(sdatain) / sizeof(char) );
    Serial.write(sdatain[0]);
    Serial.write(sdatain[1]);
    Serial.write(sdatain[2]);
    Serial.write(sdatain[3]);
    myservo0.write(sdatain[0]);              // tell servo to go to position in variable 'pos'
    myservo1.write(sdatain[1]);              // tell servo to go to position in variable 'pos'
    myservo2.write(sdatain[2]);              // tell servo to go to position in variable 'pos'
    myservo3.write(sdatain[3]);       
  }
    
  }



void loop() {
       // tell servo to go to position in variable 'pos'

}

