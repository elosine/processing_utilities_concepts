// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="bot1.svg"; */
PShape minim;
PShape stem, s1, s2, s3, s4;
PShape notehead;
String name;

String path = sketchPath("svgs/");
void setup() {
  size(640, 360);
  minim = loadShape(path + "Black_mensural_semibrevis.svg");
 // stem = minim.getChild(1);
 // s1 = stem.getChild(0);
 // s2 = s1.getChild(0);
 // s3 = s2.getChild(0);
 // name =  s3.getChild(0).getName();
 // println(minim.getWidth());
} 
void draw() {
  background(255);
  fill(153, 255, 0);
  ellipse(100, 100, 5, 5);
  noFill();
  // rect(100, 100, 60, 80);
  pushMatrix();
  translate(100, 100);
  // scale(1.5);
  //shape(minim, 0,0, 60, 80);
  //minim.disableStyle();

  stroke(153, 255, 0);
  fill(153, 255, 0);
  shape(minim, 0, 0);
  popMatrix();
 // shape(s3, 200, 200);
}

