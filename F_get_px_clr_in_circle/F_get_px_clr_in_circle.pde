int numOfColoredPxInCircle(int cx, int cy, int radius, int r, int g, int b) {
  int ct = 0;
  
  int x1 = cx - radius;
  int x2 = cx + radius;
  int y1 = cy - radius;
  int y2 = cy + radius;

  loadPixels();
  for (int i=y1; i<=y2; i++) {
    for (int j=x1; j<=x2; j++) {
      float l = dist(j, i, cx, cy);
      if (l <= radius) {
        color pxclr =   pixels[i*width+j];
        float pr = red(pxclr);
        float pg = green(pxclr);
        float pb = blue(pxclr);
        if (pr==r && pg==g && pb==b) {
          ct++;
        }
      }
    }
  }
  return ct;
}

int radius = 30;
int cx = 50;
int cy = 50;

void setup(){
  size(500, 500);
}

void draw() {
  background(0);
  noStroke();

  fill(255);
  ellipse(cx, cy, radius*2, radius*2);

  fill(0, 255, 0);
  rect(cx-30, cy-10, 70, 120);
}


void mousePressed(){
  println( numOfColoredPxInCircle(cx, cy, radius, 0, 255, 0) );
  println( numOfColoredPxInCircle(cx, cy, radius, 255, 255, 255) );
}

