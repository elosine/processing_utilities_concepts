int s = 1;

void setup() {
  size (500, 500, OPENGL);
}

void draw() {
  background(0);
  
  //lighting
 spotLight(255, 255, 255, width/2, height/2, 1000, 0, 0, -1, PI/4, 2);
  
  /*
  //perspective
  if(mousePressed) {
    float fov = PI/3.0; 
    float cameraZ = (height/2.0) / tan(fov/2.0); 
    perspective(fov, float(width)/float(height), cameraZ/2.0, cameraZ*2.0); 
  } else {
    ortho(0, width, 0, height); 
  }
  */
  

  noStroke();
 // stroke(255, 128, 0);
  fill(0, 255, 0, 255);
 // noFill();
  pushMatrix();
  translate(0, height/2);
  translate(s, 0);
  sphere(50);
  translate(0, -100);
  box(50);
  glow(4, 1);
  translate(0, 100);
  sphere(30);
  popMatrix();
  //glow(4, 1);

  s++;
  }

