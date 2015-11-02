//Type into textbox
//when you hit enter a button will be created that will then send this message
//label


import oscP5.*;
import netP5.*;

OscP5 meosc;
NetAddress dosc;
int val = 498;

String[] msg = {"/what", "int:1", "str:you", "float:1.222"};

void setup() {
  size(500, 500);
  meosc = new OscP5(this, 12321);
  dosc = new NetAddress("127.0.0.1", 12322);
}

void draw() {
  background(0);
}

void mousePressed() {

  meosc.send("/t", new Object[] {"seq", "set", "amp", val}, dosc);

}



