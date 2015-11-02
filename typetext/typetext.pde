//MAKE OSC TEXT BOX CLASS
import oscP5.*;
import netP5.*;

OscP5 meosc;
NetAddress sc;


String myText = "";
int border = 10;
 
void setup() {
  size(500, 500);
  
  
  meosc = new OscP5(this, 12321);
  sc = new NetAddress("127.0.0.1", 57120);
}
 
void draw() {
  background(0);
  rectMode(CORNER);
  noStroke();
  fill(255);
  rect(100, 100, 400, 60);
  
  textAlign(LEFT, CENTER);
  textSize(30);
  fill(0, 255, 0);
  text(myText, 100+border, 100, 400-border, 60);
}
 
void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (myText.length() > 0) {
      myText = myText.substring(0, myText.length()-1);
    }
  } 
  //
  else if (keyCode == DELETE) {
    myText = "";
  } 
  //
  else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    myText = myText + key;
  }
}

