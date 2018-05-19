// Trucky McTruckface Mk.3 - 2018
// Junior Solar Sprints
// Michael Cerne
// Motor/Lighting Controller

int serIn, blinkt;
bool blinkl, blinkr;
 
void setup() {
  Serial.begin(9600);
  Serial.println("Waiting");
}

void loop (){
  if(Serial.available()) {    
    while(Serial.available()>0){
      serIn = Serial.read();  // Read serial        
      switch(serIn){
        case '0': // Stop Motor
          digitalWrite(8, LOW);
          digitalWrite(9, LOW);
          Serial.println("ln");
          break;
        case '1': // Start Motor (Forward)
          digitalWrite(9, LOW);
          digitalWrite(8, HIGH);
          break;
        case '2': // Start Motor (Reverse)
          digitalWrite(8, LOW);
          digitalWrite(9, HIGH);
          break;
        case '3': // Disable Lighting
          analogWrite(5, 0);
          break;
        case '4': // Dim Lighting
          analogWrite(5, 50); 
          break;
        case '5': // Full Lighting
          analogWrite(5, 255); 
          break;
      }
      serIn = 0;
    }
  }
}
