
float cx, cy; 
int cd = 100;
float cr;
float currdeg = 0;
float accl = -0.35;
float vel = 29;


void setup() {
  size(300, 300);
  smooth();

  cx = width/2;
  cy = height/2;
  cr = cd/2;
}

void draw() {
  background(0);

  ellipseMode(CENTER);
  noStroke();
  fill(255);
  ellipse(cx, cy, cd, cd);

  pushMatrix();
  rectMode(CENTER);
  fill(255, 0, 128, 150);
  translate(cx, cy);
  rotate(radians(currdeg));
  rect(0, 0, 2, cd);
  rotate(radians(90));
  rect(0, 0, 2, cd);
  popMatrix();
  
  vel = constrain( (vel += accl), 0, 50);
  currdeg += vel;
  
}

void mousePressed(){
  vel = 29;
}
















