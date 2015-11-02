PImage img;
PGraphics msk;
PGraphics os;
int x;

void setup() {
  size(720, 480, P2D);
  msk = createGraphics(width, height, P2D);
  os = createGraphics(width, height, P2D);
 
}
void draw() { 

 os.beginDraw();
  os.background(244, 90, 10);
  os.noStroke();
  os.fill(0, 255, 0);
  os.rect(width/2, 100, 50, 50);
  os.endDraw();
  img = os.get(0, 0, width, height);


  // draw the mask
  msk.beginDraw();
  msk.background(0);
  msk.stroke(255);
  msk.line(0, x%height, msk.width, x++%height);
  msk.ellipse(width/2, x%height, 100, 100);
  msk.endDraw();
  // apply the mask to the image, both offscreen
  img.blend(msk, 0, 0, img.height, img.width, 0, 0, img.width, img.height, MULTIPLY);
  // draw the masked image to the screen
  image(img, 0, 0, width, height);
}

