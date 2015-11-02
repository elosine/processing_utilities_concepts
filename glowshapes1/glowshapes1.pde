PGraphics gl1, gl2;
PImage img1, img2;
int w = 1066;
int h = 600;


color c;

float x1, y1;
float curvePointX = 0; 
float curvePointY = 0;

int counter;
int maxCounter = 3;


void setup() {
  size(w, h, P3D);
  gl1 = createGraphics(w, h, P3D);
  gl2 = createGraphics(w, h, P3D);

  x1 = width/2;
  y1 = height/2;
  mi1();
  mi2();
}

void draw() {
  background(128);
  image(img2, 0, 0);
}


void mi1() {
  /*
  gl1.beginDraw();
   
   
   gl1.background(128);
   // gl1.noStroke();
   gl1.strokeWeight(2);
   gl1.stroke(80, 255, 0);
   
   gl1.pushMatrix();
   gl1.rectMode(CENTER);
   gl1.translate(5, 5);
   gl1.rotate(radians(0));
   //gl1.rect(0, 0, 140, 16);
   gl1.line(0, 0, 300, 0);
   glow(2, 1, gl1);
   gl1.popMatrix();
   
   gl1.endDraw();
   */

  gl1.beginDraw();

  gl1.background(0);

  // gl1.colorMode(HSB, 360, 100, 100);
  gl1.noFill();
  float hueValue = hue(c);
  // gl1.strokeWeight(hueValue/5);
  gl1.strokeWeight(2);
  //gl1.stroke(c);
  //gl1.noFill();
  gl1.stroke(0, 130, 137);

  for (int j=0; j<4; j++) {
    gl1.beginShape();
    gl1.curveVertex(x1, y1);
    gl1.curveVertex(x1, y1);
    for (int i = 0; i < 10; i++) {
      curvePointX = constrain( x1+random(-80, 80), (width/2)-100, (width/2)+100);
      curvePointY = constrain(y1+random(-80, 80), (height/2)-100, (height/2)+100);
      gl1.curveVertex(curvePointX, curvePointY);
    }
    gl1.curveVertex(curvePointX, curvePointY);
    gl1.endShape();
    x1 = curvePointX;
    y1 = curvePointY;
  }

  glow(3, 3, gl1);
  gl1.endDraw();


  img1 = gl1.get(0, 0, gl1.width, gl1.height);
}


void mi2() {
  gl2.beginDraw();
  gl2.strokeCap(ROUND);
  gl2.smooth();
  gl2.noFill();
   gl2.stroke(208, 32, 144);

  gl2.background(128);  
  gl2.translate(width/2, height/2);

  int circleResolution = (int) map(mouseY, 0, height, 2, 80);
  float radius = mouseX-width/2 + 0.5;
  float angle = TWO_PI/circleResolution;

  gl2.strokeWeight(mouseY/20);

  gl2.beginShape();
  for (int i=0; i<=circleResolution; i++) {
    float x = cos(angle*i) * radius;
    float y = sin(angle*i) * radius;
    gl2.line(0, 0, x, y);
    // vertex(x, y);
  }
  gl2.endShape();
  
  glow(3, 2, gl2);
  gl2.endDraw();
  img2 = gl2.get(0, 0, gl2.width, gl2.height);
}


void mouseDragged(){
  mi2();
}
