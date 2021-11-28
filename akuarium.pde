PImage ikan1;
PImage ikan2;
int garisx=0;
int garisy=0;

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
float zoi=0.25;
float perjalanan=0;
int lastY=y;


void draw() {
  background(173,216,230);
  akuarium();
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
void akuarium() {
  fill(255, 255, 255, 30);
stroke(255, 100);

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
