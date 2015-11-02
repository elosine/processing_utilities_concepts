PGraphics rotate_light;
PGraphics frame;
int playerX, playerY;
color maskclr = color(10, 10, 10);
int spsz1 = 100;
int spsz2 = 150;
int s2y = 0;
int dir = 1;

public static PGraphics spotlight1, spotlight2;

void setup(){
  size(800, 600);
  frame = createGraphics(width, height);
  frame.imageMode(CENTER);
  frame.ellipseMode(CENTER);
  imageMode(CORNER);
    spotlight1 = createGraphics(spsz1, spsz1);
  light_init(spsz1, spotlight1, maskclr);
    spotlight2 = createGraphics(spsz2, spsz2);
  light_init(spsz2, spotlight2, maskclr);
  rotate_light = createGraphics(width, height);
  rotate_light.imageMode(CENTER);
  frameRate(60);
}

void draw(){
  // DRAW MASKED FRAME
  frame.beginDraw();
  frame.background(255, 0, 0);
  frame.fill(255);
  frame.ellipse(width/2, height/2, width, height);
  frame.fill(128);
  frame.ellipse(width/2, height/2, width/2, height/2);
  frame.endDraw();


  //Draw Spotlight mask
  rotate_light.beginDraw();
  rotate_light.background(10, 10, 10); //control alpha of mask
  rotate_light.image(spotlight1, mouseX, mouseY);
  rotate_light.image(spotlight2, 100, s2y);
  rotate_light.endDraw();
  if(s2y<0)dir=1;
  if(s2y>height)dir=-1;

  s2y = s2y + (1*dir);


  // APPLY FLASHLIGHT MASK TO FRAME
  mask(frame, rotate_light);

  // CLEAR BACKGROUND
  background(0);

  // DRAW MASKED IMAGE
  image(frame, 0, 0);
}


void light_init(int size, PGraphics img, color maskclr) {
  img.beginDraw();
  img.ellipseMode(CENTER);
  img.background(maskclr); //frame around mask should be same as above masking alpha
  noStroke();
  img.fill(255);
  img.ellipse(size/2, size/2, size, size);
  img.endDraw();
}


void mask(PImage target, PImage mask) {
  mask.loadPixels();
  target.loadPixels();
  if (mask.pixels.length != target.pixels.length) {
    println("Images are not the same size");
  } 
  else {
    for (int i=0; i<target.pixels.length; i++) {
      target.pixels[i] = ((mask.pixels[i] & 0xff) << 24) | (target.pixels[i] & 0xffffff);
    }
    target.updatePixels();
  }
}

