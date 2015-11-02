PVector loc, dir, dest, addpt, rla, rlb;
int r = 5;
int x = 50;
int y = 50;
int dx = 450;
int dy = 450;



void setup() {
  size(500, 500);

  loc = new PVector(x, y);
  dir = new PVector();
  dest = new PVector(dx, dy);
  addpt = new PVector(x, y);
  dir = PVector.sub(dest, loc);


  rla = new PVector(loc.y, -loc.x);
  rla.normalize();
  // Track width
  rla.mult(10);
  
  rlb = new PVector(loc.y, -loc.x);
  rlb.normalize();
  // Track width
  rlb.mult(-10);
  
 
}

void draw() {
  background(0);


  noStroke();
  fill(0, 255, 0);
  //first pt
  ellipse(loc.x, loc.y, r, r);
  //last pt
  ellipse(dest.x, dest.y, r, r);

  fill(255);
  addpt = PVector.add( loc, PVector.mult(dir, 0.25) );
  ellipse(addpt.x, addpt.y, r, r);
  addpt = PVector.add( loc, PVector.mult(dir, 0.5) );
  ellipse(addpt.x, addpt.y, r, r);
  addpt = PVector.add( dest, PVector.mult(dir, -0.05) );
  ellipse(addpt.x, addpt.y, r, r);
  addpt = PVector.add( addpt, PVector.mult(rla, -1.0) );
  ellipse(addpt.x, addpt.y, r, r);

stroke(255);
pushMatrix();
  float numpts = 3;
  translate(loc.x, loc.y);
  line(0, 0, rla.x, rla.y);
  line(0, 0, rlb.x, rlb.y);
 for (int i = 0; i < numpts; i++) {
    translate(dir.x * (1 / numpts), dir.y * (1 / numpts));
    line(0, 0, rla.x, rla.y);
  line(0, 0, rlb.x, rlb.y);
  }
  popMatrix();}

