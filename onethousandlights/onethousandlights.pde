/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/26030*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
Circle[] circles; 
//declares array
//starts with capital letter


void setup() {
  size(500, 500);
  smooth();
  colorMode(HSB, 360, 100, 100);
  circles = new Circle[1]; //make 1000 places for objects
  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle(random(0, width), random(0, height), random(100));
  }
}

void draw() {
  background(120, 50, 50, random(1, 10));
  noStroke(); 
    for (int i=0; i< circles.length; i++) {
      circles[i].display();
      circles[i].move();
    }
  
}

class Circle {
  float x, y, vx, vy, gravity, friction, diameter, directionx, directiony; // fields
int blinkrate = 3;


  //constructor
  Circle(float xpos, float ypos, float dia) {
    x = xpos;
    y = ypos;
    directionx = random(-1.0, 1.0);
    directiony = random(-1.0, 1.0);
    vy = random(-2.0, 2.0);
    vx = random(-2.0, 2.0);
    diameter = dia;
    gravity = 0.01;
    friction = .3;
  }


  //methods
  void display() {
  if (frameCount%blinkrate == 0) {
  fill(random(302), 98, random(99), 25);
  }
    ellipse(x, y, diameter, diameter);
    blinkrate = round(random(50, 150));
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
  for (int i=0; i<3; i++) {
    circles = (Circle[]) append( circles, new Circle(random(0, width), random(0, height), random(100)) );
  }
}

