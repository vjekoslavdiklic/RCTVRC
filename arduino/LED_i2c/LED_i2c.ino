#include <Wire.h>
#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
  #include <avr/power.h>
#endif

#define SLAVE_ADDRESS 0x77 //I2C slave address
#define BAUD_RATE 1000000
#define LEDNUM 16
#define PIN 2
Adafruit_NeoPixel strip = Adafruit_NeoPixel(LEDNUM, PIN, NEO_RGB + NEO_KHZ800);
Adafruit_NeoPixel strip0 = Adafruit_NeoPixel(64, PIN, NEO_RGB + NEO_KHZ800);


char wdatain[4];            //1X2 ARRAY FOR INCOMING SERIAL DATA


void setup() {
  #if defined (__AVR_ATtiny85__)
    if (F_CPU == 16000000) clock_prescale_set(clock_div_1);
  #endif
  
  strip0.begin();
  strip0.show();
  
  strip.begin();
  strip.show();
  
  //I2C settings
  Wire.begin(SLAVE_ADDRESS); //start I2C  
  Wire.onReceive(receiveData); //define recive function
  Wire.onRequest(sendData); //define send function
  
  Serial.begin(BAUD_RATE);   
}

void receiveData(int byteCount){
  
while(Wire.available()) {
  Wire.readBytes(wdatain, sizeof(wdatain) / sizeof(char) );
  Serial.println(wdatain[0]);
  if(wdatain[0]==100){
  for(int i=0;i<=LEDNUM;i++){
  strip.setPixelColor(i, strip.Color(wdatain[1], wdatain[2], wdatain[3]));    
  strip.show();
  }
  
  }
else{

strip.setPixelColor(wdatain[0], strip.Color(wdatain[1], wdatain[2], wdatain[3]));
    strip.show();
}
}
}

// callback for sending data
void sendData(){
Wire.write('a');
}


void loop() {
Serial.println("loop");
delay(1000);
}

