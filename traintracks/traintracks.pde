void setup() {
  size(200, 200);
}

void draw() {
  // Set an origin for the track
  PVector origin = new PVector(30, 30);

  // Vector of the train line
  PVector l = new PVector(100, 50);

  // Vector at right angle to train line
  PVector rl = new PVector(l.y, -l.x);
  rl.normalize();
  // Track width
  rl.mult(10);

  // Calculate end of trainline
  PVector end = PVector.add(origin, l);

  // Draw the track
  line(origin.x, origin.y, end.x, end.y);
  origin.sub(rl);
  end.sub(rl);
  line(origin.x, origin.y, end.x, end.y);

  // Draw the sleepers
  pushMatrix();
  float numSleepers = 20;
  translate(origin.x, origin.y);
  line(0, 0, rl.x, rl.y);
  for (int i = 0; i < numSleepers; i++) {
    translate(l.x * (1 / numSleepers), l.y * (1 / numSleepers));
    line(0, 0, rl.x, rl.y);
  }
  popMatrix();
}

