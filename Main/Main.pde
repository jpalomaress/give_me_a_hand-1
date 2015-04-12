// import processing.serial.*;
// Serial serialPort;


int x =300, y = 300, varText=30;
PFont xFont,yFont;
boolean locked = false, textCharged1=false, openWindowText = false, openWindowImage = false;
color buttoncolor, highlight, currentColor;
RectButton rect1, rect2, rect3;
String[] data1;
PShape divTexto;
PImage btnTexto, btnPhoto, btnMove, backgroundImage, screenshot, roca;
String estadoGuante;

boolean areaBtnDocumento=false, areaBtnPhoto=false;
int [] valores;
int indice,medio,anular,center;

//***********************variables moveObject***********************
boolean openMObject = false, areaBtnMObject=false, tom = false;
int t1=500,t2=300;
PShape divCuadro;


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

  roca = loadImage("../Images/piedra.png");
  screenshot = loadImage("../Images/status.png");

}

void draw() {
  drawCanvas();
  // estadoGuante = serialPort.readStringUntil('\n');
  // delay(5);
  // if(estadoGuante!= null) { 
  //   drawPointers();
  // }
  if(tom == true){
    tomar();
  }
}

void drawPointers() {
  valores =int(split(estadoGuante,","));
  if(estadoGuante != null && valores.length >= 5) {
    x = (int)map(valores[1],263,390,0,width);
    y = (int)map(valores[0],263,390,height,0);
    indice = (int)valores[2];
    medio = valores[3];
    anular = valores[4];
    if(indice == 1) {
      indicePressed();
    }

  }
   
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
  //Creando espacio para Mover el Objeto y el Objeto
 
    
  if(openWindowText) {
    shape(divTexto,50,10);
    fill(255,255,0);
    for (int i = 0 ; i < data1.length; i++) {
      text(data1[i],55,varText);
      varText +=15;
    }
    varText=30;
  }


  if(openWindowImage) {
    image(screenshot,30,100);  
  }

  fill(255);  

  if(openMObject) {
    shape(divTexto,50,10);
    fill(255,255,0);

    imageMode(CENTER);
    image(roca, t1, t2);
    imageMode(CORNER);
  }
  ellipse(x, y, 10, 10);
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
    areaBtnMObject = true;
  } else {
    btnMove = loadImage("../Images/remote.png");
    areaBtnMObject = false;
  }
  
  if(rect3.over(x,y)) {
    btnPhoto = loadImage("../Images/pic_over.png"); 
    areaBtnPhoto = true;
  } else {
    btnPhoto = loadImage("../Images/pic.png");
    areaBtnPhoto=false;
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
    
    case 'o':
      if(x>=(t1-125) && x<=(t1+125)){
         if(y>=t2-(129.5) && y<=t2+(129.5)){
             tom=true;
             x = t1;
             y = t2;
         }
      }else{tom = false;}  
    break;
    
    case 'p':
      t1=t1;
      t2=t2;
      tom = false;
      break;
  }
  
}

void mousePressed() {
  openWindowOnEvent();
}

void indicePressed() {
  openWindowOnEvent();
}

void openWindowOnEvent() {
  data1=loadStrings("../Documentos/Texto1.txt"); 

  if(openWindowText)
  {
    if(areaBtnDocumento) {
      openWindowText=false;
    }
        
  } else {
    if(areaBtnDocumento) {
      openWindowText=true;
    }
  }
  
  if(openWindowImage) {
    if(areaBtnPhoto) {
       openWindowImage = false;    
    }
    
  } else {
    if(areaBtnPhoto) {
      openWindowImage = true;
    }
  }
  
  if(areaBtnPhoto) {  
    saveFrame("../Images/screen.jpg");
    screenshot = loadImage("../Images/status.png");
  }

  
  if(openMObject) {
    if(areaBtnMObject) {
      openMObject=false;
    }
  } else {
    if(areaBtnMObject) {
      openMObject=true;
    } 
  }
}

void tomar(){
  t1 = x;
  t2 = y;
 
 }




