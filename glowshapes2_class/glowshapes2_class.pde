//PGraphics gl1, gl2;
//PImage img1, img2;
int w = 1066;
int h = 600;
int anispd = 10;


//color c;

//float x1, y1;
//float curvePointX = 0; 
//float curvePointY = 0;

//int counter;
//int maxCounter = 3;
Squiggle sq;
//PGraphics buf;

void setup() {
  size(w, h, P3D);
  // gl1 = createGraphics(w, h, P3D);
  // gl2 = createGraphics(w, h, P3D);
  // buf = createGraphics(w, h, P3D);

  //x1 = width/2;
  // y1 = height/2;
  sq = new Squiggle(0, 300, 300, 33, "orange");
  sq.render();
  // mi1();
  // mi2();
}

void draw() {
  background(0);
  noFill();
  stroke(255, 0, 0);
  sq.drw();
  if(frameCount%anispd ==0){
   sq.render();
   anispd = int(random(2, 20));
  } 
}

/*
 
 
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
 */
