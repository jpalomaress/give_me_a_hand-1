/*
Give me a hand

Alexandro Hofflich

 */
 int xAxis= 0;
 int yAxis= 1;
 int xAcc;
 int yAcc;
 int zAcc;
 int boton = 2;
int boton2 = 3;
int boton3 =4;
int valorBoton;
int valorBoton2;
int valorBoton3;
int xAccAnterior,yAccAnterior,valorBotonAnterior, valorBoton2Anterior, valorBoton3Anterior;
int disparo;
int led = 13;
 
 void setup() {
   pinMode(boton,INPUT);
   pinMode(boton2,INPUT);
   pinMode(boton3,INPUT);
   pinMode(led,OUTPUT);
   Serial.begin(9600);
 }
 
 void loop() {
   
   xAcc = analogRead(xAxis);
   yAcc = analogRead(yAxis);
   valorBoton = digitalRead(boton);
   valorBoton2 = digitalRead(boton2);
   valorBoton3 = digitalRead(boton3);
      
   if ( xAcc >=390) {
      digitalWrite(led,HIGH);
   }else {
     digitalWrite(led,LOW);
   }
    // do not send serial data until Processing asks for it

    
   
   Serial.print(xAcc);
   Serial.print(",");
   Serial.print(yAcc);
   Serial.print(",");
   Serial.print(valorBoton);
   Serial.print(",");
   Serial.print(valorBoton2);
   Serial.print(",");
   Serial.print(valorBoton3);
   Serial.print(",");
   
   Serial.println();
   delay(200);
   /*0
   xAccAnterior = xAcc;
   yAccAnterior = yAcc;
   valorBotonAnterior = valorBoton;
   valorBoton2Anterior = valorBoton2;
   valorBoton3Anterior = valorBoton3;
 */
 
   
 }
 
