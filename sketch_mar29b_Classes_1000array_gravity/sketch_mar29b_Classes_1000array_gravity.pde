/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/26030*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
Circle[] circles; 
//declares array
//starts with capital letter
int numbercircles = 10000;
int onct = 0;

void setup() {
  size(500, 500);
  smooth();
  colorMode(HSB, 360, 100, 100);
  circles = new Circle[numbercircles]; //make 1000 places for objects
  for (int i = 0; i < numbercircles; i++) {
    circles[i] = new Circle(random(50, width), random(100, width), random(20));
  }
}

void draw() {
  background(120, 50, 50, 5);
  noStroke();
  fill(302, 98, random(99), 25);
  for (int i=0; i< circles.length; i++) {
    circles[i].display();
    circles[i].move();
  }
}

class Circle {
  float x, y, vx, vy, gravity, friction, diameter, directionx, directiony; // fields
  boolean on = false;


  //constructor
  Circle(float xpos, float ypos, float dia) {
    x = xpos;
    y = ypos;
    directionx = 1;
    directiony = 1;
    vy = -.3;
    vx = 2;
    diameter = dia;
    gravity = .02;
    friction = .3;
  }


  //methods
  void display() {
    if (on) {
      ellipse(x, y, diameter, diameter);
    }
  }


  void move() {
    vy += gravity;
    vx += .02;
    x += vx; // same as x + vx = x
    y += vy;

    if (y > height) {
      y = height;
      vy = -vy;
    }
    //  println("velocityY " + vy);
    if (y < 0) {
      vy = -vy;

      vy *= friction; //same as vy * friction = vy
    }

    if (x>width) {
      x=width;
      vx = -vx;
    }
    //println("velocityX " + vx);

    if (x<0) {
      x=0;
      vx = -vx;
    }
  }
}


void mousePressed() {
  if (onct<=numbercircles) {
    for (int i=0; i<30; i++) {
      circles[onct].on = true;
      onct++;
    }
  }
}

