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
  fill(255);
  textSize(45);
  text("Clean",xButton+20,100);
  
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
  rumput1();
  rumput2();
  ikan(x,y,w,h);
  istana();
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

int xAcc=1200;
int yAcc=750;

void istana() {
//istana pasir
  fill(255,220,160);
  rect(xAcc-776,yAcc-420,40,60,20);
  fill(242,191,106);
  rect(xAcc-795,yAcc-400,32,40,20);
  rect(xAcc-750,yAcc-400,32,40,20);
  fill(255,220,160);
  rect(xAcc-808,yAcc-370,105,95,20);
  fill(242,191,106);
  rect(xAcc-840,yAcc-325,32,40,20);
  rect(xAcc-770,yAcc-325,32,40,20);
  rect(xAcc-705,yAcc-325,32,40,20);
  fill(255,220,160);
  rect(xAcc-855,yAcc-300,200,150,20);
  fill(242, 191, 106);
  rect(xAcc-880,yAcc-215,32,40,20);
  rect(xAcc-810,yAcc-215,32,40,20);
  rect(xAcc-735,yAcc-215,32,40,20);
  rect(xAcc-655,yAcc-215,32,40,20);
  fill(255,220,160);
  rect(xAcc-900, yAcc-190, 300, 200, 20);
  fill(219, 168, 81);
  rect(xAcc-800,yAcc-100,100,150,70);
  rect(xAcc-880,yAcc-140, 55, 55, 20);
  rect(xAcc-675,yAcc-140,55,55,20);
  
  
  //rocks
  fill(194, 196, 195);
  ellipse(xAcc-1000,yAcc-35,100,80);
  ellipse(xAcc-1100,yAcc-25,120,75);
  fill(127, 130, 128);
  ellipse(xAcc-1050,yAcc-15,60,50);
  ellipse(xAcc-965,yAcc-15,40,30);

    
  //rocks2
  fill(194,196,195);
  ellipse(xAcc-355,yAcc-35,150,95);
  ellipse(xAcc-280,yAcc-25,120,75);
  fill(127,130,128);
  ellipse(xAcc-320,yAcc-15,60,50);
  ellipse(xAcc-425,yAcc-15,60,70);


}

void rumput1() {
    //seaweed1
  noStroke();
  fill(164, 204, 159);
  rect(xAcc-1200,yAcc-100,20,150,30);
  rect(xAcc-1240,yAcc-100,60,20,30);
  rect(xAcc-1235,yAcc-50,40,20,25);
  rect(xAcc-1200,yAcc-140,20,50,20);
  rect(xAcc-1190,yAcc-140,70,20,20);
  rect(xAcc-1140,yAcc-190,20,70,20);
  rect(xAcc-1240,yAcc-160,20,70,20);
  rect(xAcc-1200,yAcc-200,20,85,30);
  
}

void rumput2() {
    //rumput laot
  fill(126, 191, 130);
  rect(xAcc-500,yAcc-100,20,150,30);
  rect(xAcc-550,yAcc-100,70,20,30);
  rect(xAcc-550,yAcc-150,20,70,30);
  rect(xAcc-495,yAcc-140,65,20,30);
  rect(xAcc-500,yAcc-140,20,150,20);
  rect(xAcc-450,yAcc-195,20,70,20);
  rect(xAcc-500,yAcc-200,20,90,30);
}
