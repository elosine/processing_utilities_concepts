int radius = 30;
int cx = 50;
int cy = 50;
int x1, x2, y1, y2;

int x=28;
int y=70;
int greenct = 0;
color pxclr;
float r, g, b;




float l = 0;

void setup() {
  size(300, 300);
  x1 = cx-radius;
  x2 = cx + radius;
  y1 = cy - radius;
  y2 = cy + radius;
}

void draw() {
  background(0);
  noStroke();


  fill(255);
  ellipse(cx, cy, radius*2, radius*2);

  fill(0, 255, 0);
  rect(cx-30, cy, 2, 1);
  
  loadPixels();
  for (int i=y1; i<=y2; i++) {
    for (int j=x1; j<=x2; j++) {
      l = dist(j, i, cx, cy);
      if (l<=radius) {
        pxclr =   pixels[i*width+j];
        r = red(pxclr);
        g = green(pxclr);
        b = blue(pxclr);
        //println(g);
        if (r == 0 && g==255 && b==0) {
          greenct++;
        }
      }
    }
    
  }

  println(greenct);
  greenct = 0;
}




