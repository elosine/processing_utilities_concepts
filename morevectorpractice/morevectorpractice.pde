// Non-static (lerp on a specific vector)

PVector current;
PVector target;
float interp = 0.1;

void setup() {
  size(500, 500);
  current = new PVector(0.0, 0.0);
  target = new PVector(500.0, 500.0);

}

void draw() {
  background(0);
  fill(0, 255, 255);
  noStroke();

  current.lerp(target, interp);
  ellipse(current.x, current.y, 20, 20);
 // interp += 0.0001;
  println(interp);
}
