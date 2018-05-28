
int pwm=0;
int ec;
int led = 9;           
int brightness = 0;   
int fadeAmount = 5;    

void setup() {
  pinMode(led, OUTPUT);
  Serial.begin(115200);
}

void loop() {
    if (Serial.available() > 0) {
      pwm= Serial.read();
      analogWrite(led, pwm);
 
    }
  }
