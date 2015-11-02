/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/17813*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

float i = 1;
float r,g,b,a;

void setup () {
  size (900,400);
  background (255);
  ellipseMode (CENTER);
  smooth ();
  frameRate(3600);
  r = random(100, 302);
  g = random(67, 150);
  b =  random(255);
  a = random(30, 80);
  
}

void draw () {
  fill(255, 0.1);
  rect(0,0,width,height);
   // if (frameCount%round(random(7, 30)) == 0) {

  r = random(100, 302);
  g = random(67, 150);
  b =  random(255);
  a = random(30, 80);
  stroke(r,g,b,a);
  //  }
  
  pushMatrix ();
  translate (450,0);
  circles (i,i);
  pushMatrix ();
  translate (0,400);
  circles (i,i);
  popMatrix ();
  popMatrix ();
  i = i*1.414;
  if (i>900) {
    i = 1;
  }
}

void circles (float center, float diameter) {
  strokeWeight (1);
  //stroke (0, 32);
  noFill ();
  ellipse (center*random(-1,1), center*random(-1,1), diameter, diameter);
  strokeWeight (.5);
 // stroke (255, 64);
  ellipse (center*random(-.1,.1), center*random(-1,1), diameter/10, diameter/10);
}

void mouseClicked () {
  setup ();
}
