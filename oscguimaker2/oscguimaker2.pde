//MAKE OSC TEXT BOX CLASS
import oscP5.*;
import netP5.*;

OscP5 meosc;
NetAddress sc;


PFont font;
int bix = 0;
int bloc = 200;
 
void setup() {
  size(500, 500);
  font = loadFont("Monaco-14.vlw");
  textFont(font);
  
  meosc = new OscP5(this, 12321);
  sc = new NetAddress("127.0.0.1", 57120);
  
  setOTextBox.mk(0, 50, 60, 440, 50);
}
 
void draw() {
  background(0);
  setOTextBox.drwset();
  setOOscButton.drwset();
 
}

void mousePressed(){
  setOOscButton.msclk();
}

void mouseMoved(){
  setOOscButton.mshvr();
}

void keyPressed(){
 setOTextBox.keyprs(); 
}
 

