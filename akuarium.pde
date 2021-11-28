PImage ikan1;
PImage ikan2;
int garisx=0;
int garisy=0;
int lastCleaning;

void setup() {
  size(1000, 750);
  ikan1 = loadImage("ikan.png");
  ikan2 = loadImage("ikan.png");
}

int x=100;
int y=100;
int lastX;

int rIkan1 = 1;
int arah=0;
float w=100;
float h=100;
int speed=4;
float zoi=0.4;
float perjalanan=0;
int lastY=y;


void draw() {
  int time = millis();
  if(time-lastCleaning <=5000) {
  background(173,216,230);
  }
  else {
    background(97,145,160);
  }
  akuarium();
  float xButton = 120;
  float yButton = 50;
  float wButton = 150;
  float hButton = 80;
  fill(80,200,120);
  rect(xButton,yButton,wButton,hButton);
  if(mousePressed){
   if(mouseX>xButton && mouseX <xButton+wButton && mouseY>yButton && mouseY <yButton+hButton){
     clean();
   }
  } 
  // ikan 1
  if(x == 900) {
    w=100;
    h=100;
    arah=1;
    rIkan1 = 0;
  }
  if(x==100) {
    w=100;
    h=100;
    rIkan1 = 1;
    arah=0;
  }
  if(arah==0) {
    if(x>50 && x<500) {
      w-=zoi;
      h-=zoi;
    }
    else if (x>=500 && x<= 900 ) {
      w+=zoi;
      h+=zoi;
    }
    x+=speed;
  }
  else {
    if(x>50 && x<500) {
      w+=zoi;
      h+=zoi;
    }
    else if (x>=500 && x<=900 ) {
      w-=zoi;
      h-=zoi;
    }
    x-=speed;
  }
  
  float apa = (int)random(0,5);
  if(apa > 3) {
    if(y<600) {
    y+=speed;
    }
    else
    y-=speed;
  }
  fill(#641E06);
strokeWeight(0);
beginShape();
vertex(0,768);
bezierVertex(75,500,150,600,200,768);
endShape();
beginShape();
vertex(150,768);
bezierVertex(225,600,300,700,350,768);
endShape();
beginShape();
vertex(300,768);
bezierVertex(375,550,450,650,500,768);

endShape(); 

  ikan(x,y,w,h);
}


void ikan(int x, int y, float w, float h) {
  if(rIkan1 == 1) {
    pushMatrix();
    scale(-1,1);
    image(ikan1,-x,y,w,h);
    popMatrix();  
  }
  else {
    image(ikan1,x,y,w,h);
  }    
}
void clean() {
  lastCleaning=millis();
}

void akuarium() {
  fill(255, 255, 255, 30);
stroke(255, 1000);

//membuat kotak

//membuat garis atas
beginShape();
vertex(100,100);
vertex(900,100);
endShape();

// membuat garis bawah
beginShape();
vertex(100,650);
vertex(900,650);
endShape();

// membuat garis kiri
beginShape();
vertex(100,100);
vertex(100,650);
endShape();

// membuat garis kanan
beginShape();
vertex(900,650);
vertex(900,100);
endShape();

// membuat ruas kiri atas
beginShape();
vertex(0,0);
vertex(100,100);
endShape();

// membuat ruas kiri bawah
beginShape();
vertex(0,750);
vertex(100,650);
endShape();

// membuat ruas kanan atas
beginShape();
vertex(1000,0);
vertex(900,100);
endShape();

// membuat ruas kanan bawah
beginShape();
vertex(1000,750);
vertex(900,650);
endShape();

noFill();
noStroke();

}
