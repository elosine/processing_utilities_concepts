import oscP5.*;
import netP5.*;

OscP5 meosc;
NetAddress dosc;


void setup() {
  // size(500, 500);
  meosc = new OscP5(this, 57120);
  meosc.plug(this, "get", "/t");
}

void draw() {
  background(0);
}


void get(String [] a) {
 
  println(a );
}

void oscEvent(OscMessage theOscMessage) {
  println("### received an osc message.");
  println("### addrpattern\t"+theOscMessage.addrPattern());
  println("### typetag\t"+theOscMessage.typetag());
}

