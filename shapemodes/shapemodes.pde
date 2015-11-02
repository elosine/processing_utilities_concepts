

void setup(){
  size(400, 400);
}

void draw(){
  background(0);
  noFill();
  stroke(255);
  rectMode(CORNER);
  rect(width/2, height/2, 80, 80);
  line(width/2, height/2, (width/2)+80, (height/2)+80);
  
  stroke(255,0,0);
  rectMode(CENTER);
  rect(width/2, height/2, 80, 80);
  pushMatrix();
  translate(width/2, height/2);
  line(0,0,80,80);
  rotate(radians(90));
  line(0,0,80,80);
  popMatrix();
}
