PGraphics sourceGraphics;
PImage sourceImage;
PGraphics mask;
 
int w = 500;
int h = 500;
 
boolean drawImage = true;
 
void setup() {
  // P2D is necessary for mask() to work with PGraphics.
  // Swap in the first two lines for these to see the error.
  // size(w,h);
  // sourceGraphics = createGraphics(w, h);
  size(w, h, P2D);
  sourceGraphics = createGraphics(w, h, P2D);
 
  sourceImage = createImage(w, h, RGB);
 
  sourceGraphics.beginDraw();
  for (int x = 0; x < w; x++) {
    for (int y = 0; y < h; y++) {
      int i = x + y*h;
      sourceImage.pixels[i] = color(255, 0, 0);
      sourceGraphics.fill(0, 255, 0);
      sourceGraphics.noStroke();
      sourceGraphics.ellipse(x, y, 1, 1);
    }
  }
  sourceGraphics.endDraw();
 
  mask = createGraphics(500, 500);
  mask.beginDraw();
  mask.background(255);
  mask.fill(0);
  mask.ellipse(w/2, h/2, 50, 50);
  mask.endDraw();
 
  sourceImage.mask(mask);
  sourceGraphics.mask(mask);
}
 
 
 
void draw() {
  background(255);
  if (drawImage) {
    image(sourceImage, 0, 0);
  } 
  else {
    image(sourceGraphics, 0, 0);
  }
}
 
void mousePressed() {
  drawImage = !drawImage;
}
