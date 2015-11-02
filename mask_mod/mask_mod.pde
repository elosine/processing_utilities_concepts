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
    mask = createGraphics(w, h, P2D);

}



void draw() {
  background(0);


  sourceGraphics.beginDraw();
 // sourceGraphics.background(0);
      sourceGraphics.fill(255, 0, 0);
      sourceGraphics.noStroke();
      sourceGraphics.ellipse(300, 300, 50, 50);
    
  
  sourceGraphics.endDraw();

  mask.beginDraw();
  mask.background(0, 0, 0);
  mask.fill(255);
  mask.ellipse(320, 300, 50, 50);
  mask.endDraw();

  sourceGraphics.mask(mask);


  image(sourceGraphics, 0, 0);
}

