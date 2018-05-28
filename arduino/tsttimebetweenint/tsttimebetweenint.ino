/* 
 * Arduino 101: timer and interrupts
 * 2: Timer1 overflow interrupt example 
 * more infos: http://www.letmakerobots.com/node/28278
 * created by RobotFreak 
 */
#define BAUD_RATE 1000000
#define ledPin 12
void setup()
{
  Serial.begin(BAUD_RATE);
  pinMode(ledPin, OUTPUT);

  // initialize TIMER2
  noInterrupts();           // disable all interrupts
  TCCR2A = 0;
  TCCR2B = 0;
  TCNT2 = 157;            // preload timer 65536-16MHz/256/2Hz 0.010048s
  TCCR2B = B00000111;//clock/1024
  TIMSK2 |= (1 << TOIE1);   // enable timer overflow interrupt
  //interrupts();             // enable all interrupts

  // initialize TIMER1
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1 = 0;            // preload timer 65536-16MHz/256/2Hz
  TCCR1B= B00000101;//clock/1024
  interrupts();             // enable all interrupts
}


ISR(TIMER2_OVF_vect)        
{
  TCNT2 = 157;            // preload timer
  digitalWrite(ledPin, digitalRead(ledPin) ^ 1);
}

void loop()
{
  Serial.println(TCNT1,DEC);
}

