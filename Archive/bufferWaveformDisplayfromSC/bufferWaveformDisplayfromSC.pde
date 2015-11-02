//MAKE A DRAGGABLE RANGE

import oscP5.*;
import netP5.*;
OscP5 meosc;

int bufsize = 800;

float[] sampArray;
float scrubx = 0.0;

void setup() {
  size(800, 800);
  sampArray = new float[bufsize];
  for (int i=0; i<bufsize; i++) {
    sampArray[i] = 0.0;
  }

  OscProperties properties= new OscProperties();
  //properties.setRemoteAddress("127.0.0.1", 57120);  //osc send port (to sc)
  properties.setListeningPort(12321);               //osc receive port (from sc)/*
  properties.setDatagramSize(5136);  //5136 is the minimum 
  meosc= new OscP5(this, properties);
  
  meosc.plug(this, "scrubpos", "/scrubpos");
}

void draw() {
  background(0);
  for(int i=1;i<bufsize;i++){
    stroke(153, 255, 0);
    line(i-1, 400 - (sampArray[i-1] * 300), i, 400 - (sampArray[i] * 300) );
  }
  
  //Scrubber
  stroke(255, 0, 255);
  line(scrubx, 300, scrubx, 500);
}


void oscEvent(OscMessage msg) {
 print(" addrpattern: "+msg.addrPattern());
  println(" typetag: "+msg.typetag());
  if ( msg.checkAddrPattern("/sbuf") ) {
    
  for(int i=0;i<bufsize;i++){
     sampArray[i] = msg.get(i).floatValue();
     }
     
  }
}

void scrubpos(float pos){
  scrubx = pos*bufsize;
}

