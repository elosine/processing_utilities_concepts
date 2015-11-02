PVector loc, dir, dest, cloc;
int r = 30;
int dur = 30000;
int currtime = 0;
int x = 50;
int y = 50;
int dx = 450;
int dy = 450;



void setup() {
  size(500, 500);

  loc = new PVector(x, y);
  dir = new PVector();
  dest = new PVector(dx, dy);
  cloc = new PVector(x, y);
}

void draw() {
  background(0);

  dir = PVector.sub(dest, loc);

  float normalizedTime = lerp( 0.0, 1.0, currtime/float(dur) );
  println(normalizedTime);
  cloc = PVector.add(cloc, PVector.mult(dir, normalizedTime));
  currtime += 1;

  fill(0, 255, 0);
  ellipse(cloc.x, cloc.y, r, r);
}

