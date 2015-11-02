PImage but, butpres;

void setup(){
 size(500, 500);
but = loadImage("button_norm.png");
butpres = loadImage("button_pressed.png");
}

void draw(){
  background(0);
  image(but, 100, 100);
}
