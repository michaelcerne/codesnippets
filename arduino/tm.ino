int serIn, blinkt;
bool blinkl, blinkr;
 
void setup() {
  Serial.begin(9600);
  Serial.println("Waiting");
}

void loop (){
  if(Serial.available()) {    
    while(Serial.available()>0){
      serIn = Serial.read();  //read Serial        
      switch(serIn){
        case '0':
          digitalWrite(8, LOW);
          digitalWrite(9, LOW);
          Serial.println("ln");
          break;
        case '1':
          digitalWrite(9, LOW);
          digitalWrite(8, HIGH);
          break;
        case '2':
          digitalWrite(8, LOW);
          digitalWrite(9, HIGH);
          break;
        case '3':
          analogWrite(5, 0);
          break;
        case '4':
          analogWrite(5, 50); 
          break;
        case '5':
          analogWrite(5, 255); 
          break;
      }
      serIn = 0;
    }
  }
}
