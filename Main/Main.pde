PShape square;  // The PShape object
int xLeft =300;
int yLeft =300;
int zLeft =0;
PFont xLeftFont,yLeftFont; 
boolean locked = false;
color buttoncolor, highlight;
color currentColor;
RectButton rect1, rect2, rect3;

int varText=30;
String[] data1;
boolean textCharged1=false;
PShape divTexto;
PImage btnTexto;
PImage btnPhoto;
PImage btnMove;
PImage backgroundImage;
boolean openWindowText = false;

void setup() {
  size(765, 574, P2D);
  xLeftFont = createFont("Arial",16,true); 
  yLeftFont = createFont("Arial",16,true); 
  
  // Define and create rectangle button
  buttoncolor = color(181,173,173);

  rect1 = new RectButton(20,  470, 100, highlight);
  rect2 = new RectButton(170, 470, 100, highlight);
  rect3 = new RectButton(320, 470, 100, highlight);

  divTexto = createShape(RECT, 0, 0, 700, 450);
  divTexto.setFill(color(255, 255, 255));
  divTexto.setStroke(false);
  
  btnTexto = loadImage("../Images/mission.png");
  btnPhoto = loadImage("../Images/pic.png");
  btnMove = loadImage("../Images/remote.png");
  backgroundImage= loadImage("../Images/space.jpg");
}

void draw() {
  //background(181,173,173);
  background(backgroundImage);
  textFont(xLeftFont,16);
  //text("X Left: "+xLeft,300,100);
  textFont(xLeftFont,16);
  //text("y Left: "+yLeft,300,120);  
  
  update(xLeft, yLeft);
  rect1.display();
  rect2.display();
  rect3.display();
  
  stroke(204, 102, 0);
  image(btnTexto, 20, 470);
  image(btnMove, 170, 470);
  image(btnPhoto, 320, 470);
  stroke(0);
  
  if(openWindowText)
  {
    shape(divTexto,50,10);
    //text(println(data1),155,55); 
    //if(!textCharged1)
    //{
      fill(0,0,0);
      for (int i = 0 ; i < data1.length; i++) {
        text(data1[i],55,varText);
        varText +=15;
      }
      varText=30;
      //textCharged1=true;
    //}
  }

  ellipse(xLeft, yLeft, 10, 10);
  
}

void update(int x, int y) {  

   checkRects(x, y);
}
void checkRects(int x, int y){
  if(rect1.over(x,y)) {
    currentColor = rect1.basecolor;
    // btnTexto = loadImage("laDefense.jpg");
    text("rect1 is over", 0,0,0);
     println("rect1 is over");
    btnTexto = loadImage("../Images/mission_over.png");

  } else {
    btnTexto = loadImage("../Images/mission.png");
  } 

  if(rect2.over(x,y)) {
    println("rect2 is over");
    btnMove = loadImage("../Images/remote_over.png");
  } else 
  {
    btnMove = loadImage("../Images/remote.png");
  }
  
  
  if(rect3.over(x,y)) {
    println("rect3 is over");
    btnPhoto = loadImage("../Images/pic_over.png"); 
  }else
  {
    btnPhoto = loadImage("../Images/pic.png");
  }
}

void keyPressed() {
  switch(key)
  {
    case 113:
      xLeft= xLeft + 10;
      break;
      
    case 119:
      xLeft = xLeft - 10;
      break;
      
      case 97:
      yLeft = yLeft + 10;
      break;
      
    case 115:
      yLeft = yLeft-10;
      break;
    
  }
}

void mousePressed() {
   data1=loadStrings("../Documentos/Texto1.txt"); 
  
  if(openWindowText)
    openWindowText=false;
  else
    openWindowText=true;
}




