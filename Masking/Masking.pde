PGraphics rotate_light;
PGraphics frame;
int playerX, playerY;

void setup()
{
  size(800, 600);
  frame = createGraphics(width, height);
  frame.imageMode(CENTER);
  frame.ellipseMode(CENTER);
  imageMode(CORNER);
  light_initialize();
  rotate_light = createGraphics(width, height);
  rotate_light.imageMode(CENTER);
  frameRate(60);
}

void draw()
{
  // DRAW NEW FRAME
  frame.beginDraw();
  frame.background(255, 0, 0);
  frame.fill(255);
  frame.ellipse(width/2, height/2, width, height);
  frame.fill(128);
  frame.ellipse(width/2, height/2, width/2, height/2);
  frame.endDraw();

  /*
  // DRAW FLASHLIGHT MASK
   rotate_light.beginDraw();
   rotate_light.background(0);
   rotate_light.translate(width/2, height/2);
   rotate_light.rotate(-point_dir());
   rotate_light.image(light_img, 0, 0);
   rotate_light.rotate(point_dir());
   rotate_light.translate(-width/2, -height/2);
   rotate_light.endDraw();
   */

  //Draw Spotlight mask
  rotate_light.beginDraw();
  rotate_light.background(10, 10, 10); //control alpha of mask
  rotate_light.image(light_img, mouseX, mouseY);
  rotate_light.endDraw();


  // APPLY FLASHLIGHT MASK TO FRAME
  mask(frame, rotate_light);

  // CLEAR BACKGROUND
  background(0);

  // DRAW MASKED IMAGE
  image(frame, 0, 0);
}

float point_dir()
{
  return (float)Math.atan2(mouseX - width/2, mouseY - height/2) - PI/2;
}

public static float light_direction = 0f;
public static PGraphics light_img;
public static int light_sz;

private static final float flashlight_reach = 0.85f;
private static final float flashlight_width = radians(30);
private static final int flashlight_blur = 25;

void light_initialize()
{
  light_sz = 100;
  light_img = createGraphics(light_sz, light_sz);
  light_img.beginDraw();
  light_img.ellipseMode(CENTER);
  light_img.background(10, 10, 10); //frame around mask should be same as above masking alpha
noStroke();
light_img.fill(255);
  //TYPE OF MASK
  //SPOTLIGHT
  light_img.ellipse(light_sz/2, light_sz/2, 100, 100);
  //ARC MASK
  /*
  light_img.arc(light_sz/2, light_sz/2,
   flashlight_reach * width, flashlight_reach * height,
   -flashlight_width, flashlight_width);
   */
  // light_img.filter(BLUR, flashlight_blur); //can use to blur edges
  light_img.endDraw();
}
/*
void light_initialize()
 {
 light_sz = (int)(Math.sqrt(height * height + width * width) + 1);
 light_img = createGraphics(light_sz, light_sz);
 light_img.beginDraw();
 light_img.ellipseMode(CENTER);
 light_img.background(255, 10); //white alpha is opacity of mask
 light_img.stroke(128);
 light_img.fill(255);
 //TYPE OF MASK
 //SPOTLIGHT
 light_img.ellipse(light_sz/2, light_sz/2, 100, 100);
 //ARC MASK

 light_img.arc(light_sz/2, light_sz/2,
 flashlight_reach * width, flashlight_reach * height,
 -flashlight_width, flashlight_width);
 
// light_img.filter(BLUR, flashlight_blur); //can use to blur edges
light_img.endDraw();
}
*/

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

