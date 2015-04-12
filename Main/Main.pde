// import processing.serial.*;
// Serial serialPort;


int x =300, y = 300, varText=30;
PFont xFont,yFont;
boolean locked = false, textCharged1=false, openWindowText = false;
color buttoncolor, highlight, currentColor;
RectButton rect1, rect2, rect3;
String[] data1;
PShape divTexto;
PImage btnTexto, btnPhoto, btnMove, backgroundImage;
boolean areaBtnDocumento=false;
int [] valores;
int indice,medio,anular,center;

void setup() {
  setupCanvas();
  // serialPort = new Serial(this, "/dev/cu.usbmodem1411", 9600);
  // serialPort.bufferUntil('\n');
}

void setupCanvas() {
  size(765, 574, P2D);
  xFont = createFont("Arial",16,true);
  yFont = createFont("Arial",16,true); 
  
  // Define and create rectangle button
  buttoncolor = color(181,173,173);

  center = width/2-50;
  rect1 = new RectButton(center-150,  470, 100, highlight);
  rect2 = new RectButton(center, 470, 100, highlight);
  rect3 = new RectButton(center+150, 470, 100, highlight);

  divTexto = createShape(RECT, 0, 0, 700, 450);
  divTexto.setFill(color(255, 255, 255,30));
  divTexto.setStroke(false);
  
  btnTexto = loadImage("../Images/mission.png");
  btnPhoto = loadImage("../Images/pic.png");
  btnMove = loadImage("../Images/remote.png");
  backgroundImage= loadImage("../Images/space.jpg");
}

void draw() {
  drawCanvas();
  // String estadoGuante = serialPort.readStringUntil('\n');
  // delay(5);
  // if(estadoGuante!= null) {
  //   valores =int(split(estadoGuante,","));
  //   if(estadoGuante != null && valores.length >= 5) {
  //     x = (int)map(valores[1],263,390,0,width);
  //     y = (int)map(valores[0],263,390,height,0);
  //     indice = valores[2];
  //     medio = valores[3];
  //     anular = valores[4];
  //   }
  // }
  
}

void drawCanvas() {
  background(backgroundImage);
  textFont(xFont,16);
  textFont(xFont,16);  
  update(x, y);

  rect1.display();
  rect2.display();
  rect3.display();
  
  stroke(204, 102, 0);
  image(btnTexto, center-150, 470);
  image(btnMove, center, 470);
  image(btnPhoto, center+150, 470);
  stroke(0);
  
  if(openWindowText) {
    shape(divTexto,50,10);
    fill(255,255,0);
    for (int i = 0 ; i < data1.length; i++) {
      text(data1[i],55,varText);
      varText +=15;
    }
    varText=30;
  }
  fill(255);
  ellipse(x, y, 50, 50);

}


void update(int x, int y) {  
   checkRects(x, y);
}

void checkRects(int x, int y){
  if(rect1.over(x,y)) {
    currentColor = rect1.basecolor;
    text("rect1 is over", 0,0,0);
    btnTexto = loadImage("../Images/mission_over.png");
    areaBtnDocumento = true;

  } else {
    btnTexto = loadImage("../Images/mission.png");
    areaBtnDocumento = false;
  } 

  if(rect2.over(x,y)) {
    btnMove = loadImage("../Images/remote_over.png");
  } else {
    btnMove = loadImage("../Images/remote.png");
  }
  
  if(rect3.over(x,y)) {
    btnPhoto = loadImage("../Images/pic_over.png"); 
  } else {
    btnPhoto = loadImage("../Images/pic.png");
  }
}

void keyPressed() {
  switch(key) {
    case 113:
      x= x + 10;
      break;
      
    case 119:
      x = x - 10;
      break;
      
      case 97:
      y = y + 10;
      break;
      
    case 115:
      y = y-10;
      break;
    
  }
}

void mousePressed() {
  data1=loadStrings("../Documentos/Texto1.txt"); 

  if(openWindowText)
  {
    if(areaBtnDocumento)
        openWindowText=false;
  }
  else
  {
    if(areaBtnDocumento)
      openWindowText=true;
  }
}




