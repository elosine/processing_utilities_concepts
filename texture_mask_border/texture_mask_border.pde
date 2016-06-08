

PGraphics mask;
PImage img;
PGraphics mask2;
PImage img2;
PGraphics mask3;
PImage img3;
PGraphics mask4;
PImage img4;
PGraphics mask5;
PImage img5;
PGraphics mask6;
PImage img6;
PGraphics mask7;
PImage img7;
PGraphics mask8;
PImage img8;

int w = 575;
int inc = 70;
void setup() {
  smooth();
  size(600, 600);
  surface.setResizable(true);
  img=loadImage("brushedMetalCirc.jpg");

  img2=loadImage("red_brushed_metal.jpg");
  img2.resize( (w-inc), 0);
  
  img3=loadImage("brushedMetalCirc.jpg");
  img3.resize( (w-(inc*2)), 0);
  
  img4=loadImage("brushedMetal_coldBlue.jpg");
  img4.resize( (w-(inc*3)), 0);
  
  img5=loadImage("brushedMetalCirc.jpg");
  img5.resize( (w-(inc*4)), 0);
  
  img6=loadImage("brushedMetal_blue.jpg");
  img6.resize( (w-(inc*5)), 0);
  
  img7=loadImage("brushedMetalCirc.jpg");
  img7.resize( (w-(inc*6)), 0);
  
  img8=loadImage("red_brushed_metal.jpg");
  img8.resize( (w-(inc*7)), 0);
  
  //surface.setSize(img.width, img.height);
  background(40);

  mask=createGraphics(575, 575);//draw the mask object
  mask.beginDraw();
  mask.background(0);//background color to target
  mask.fill(255);
  mask.ellipseMode(CORNER);
  mask.ellipse(0,0, w, w);
  mask.endDraw();

  mask2=createGraphics((w-inc), (w-inc));//draw the mask object
  mask2.beginDraw();
  mask2.background(0);//background color to target
  mask2.fill(255);
  mask2.ellipseMode(CORNER);
  mask2.ellipse(0, 0, (w-inc), (w-inc));
  mask2.endDraw();

  mask3=createGraphics((w-(inc*2)), (w-(inc*2)));//draw the mask object
  mask3.beginDraw();
  mask3.background(0);//background color to target
  mask3.fill(255);
  mask3.ellipseMode(CORNER);
  mask3.ellipse(0, 0, (w-(inc*2)), (w-(inc*2)));
  mask3.endDraw();

  mask4=createGraphics((w-(inc*3)), (w-(inc*3)));//draw the mask object
  mask4.beginDraw();
  mask4.background(0);//background color to target
  mask4.fill(255);
  mask4.ellipseMode(CORNER);
  mask4.ellipse(0, 0, (w-(inc*3)), (w-(inc*3)));
  mask4.endDraw();

  mask5=createGraphics((w-(inc*4)), (w-(inc*4)));//draw the mask object
  mask5.beginDraw();
  mask5.background(0);//background color to target
  mask5.fill(255);
  mask5.ellipseMode(CORNER);
  mask5.ellipse(0, 0, (w-(inc*4)), (w-(inc*4)));
  mask5.endDraw();

  mask6=createGraphics((w-(inc*5)), (w-(inc*5)));//draw the mask object
  mask6.beginDraw();
  mask6.background(0);//background color to target
  mask6.fill(255);
  mask6.ellipseMode(CORNER);
  mask6.ellipse(0, 0, (w-(inc*5)), (w-(inc*5)));
  mask6.endDraw();

  mask7=createGraphics((w-(inc*6)), (w-(inc*6)));//draw the mask object
  mask7.beginDraw();
  mask7.background(0);//background color to target
  mask7.fill(255);
  mask7.ellipseMode(CORNER);
  mask7.ellipse(0, 0, (w-(inc*6)), (w-(inc*6)));
  mask7.endDraw();

  mask8=createGraphics((w-(inc*7)), (w-(inc*7)));//draw the mask object
  mask8.beginDraw();
  mask8.background(0);//background color to target
  mask8.fill(255);
  mask8.ellipseMode(CORNER);
  mask8.ellipse(0, 0, (w-(inc*7)), (w-(inc*7)));
  mask8.endDraw();

  img.mask(mask);
  img2.mask(mask2);
  img3.mask(mask3);
  
  
  img4.mask(mask4);
  img5.mask(mask5);
  img6.mask(mask6);
  img7.mask(mask7);
  img8.mask(mask8);
}

void draw() {
  background(25,33,47);
  imageMode(CENTER);
  image(img, width/2, height/2);
  image(img2, width/2, height/2);
  image(img3, width/2, height/2);
  image(img4, width/2, height/2);
  image(img5, width/2, height/2);
  image(img6, width/2, height/2);
  image(img7, width/2, height/2);
  image(img8, width/2, height/2);
  
  ellipseMode(CENTER);
  noFill();
  strokeWeight(4);
  stroke(50);
  ellipse(width/2, height/2, (w-(inc)-2), (w-(inc))-2);
  ellipse(width/2, height/2, (w-(inc*2)-2), (w-(inc*2))-2);
  ellipse(width/2, height/2, (w-(inc*3)-2), (w-(inc*3))-2);
  
  stroke( 153, 255, 0 );
  strokeWeight(1);
  line(width/2, 0, width/2, height);
}