#define BAUD_RATE 1000000

unsigned int lsttime=0;
unsigned int cnt=0;
#define interruptPin  2 


void intfun() {
  //if(TCNT1>7){
    
  lsttime=TCNT1;cnt++;
  //}
  TCNT1=0;
  Serial.print(lsttime);
  Serial.print('_') ;
  Serial.println(cnt);
  }

void setup()
  {
  pinMode(interruptPin,INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(interruptPin), intfun , FALLING);
  Serial.begin(BAUD_RATE);
  
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1 = 0;            // preload timer 65536-16MHz/256/2Hz
  TCCR1B= B00000101;    //clock/1024) {
  // put your setup code here, to run once:

}

void loop() {
  //Serial.println(lsttime);
  // put your main code here, to run repeatedly:

}
