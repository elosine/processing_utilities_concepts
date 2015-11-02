int cx = 40;
int cy = 60;
int w = 30;
int h = 30;


void setup(){
  size(100, 100);
}

void draw(){
  background(0);
  noStroke();
  fill(0, 200, 0);
  ellipse(cx, cy, w, h);
}

//pixels[y*width+x]
