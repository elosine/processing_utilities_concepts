//MAKE A DRAGGABLE RANGE

import oscP5.*;
import netP5.*;
OscP5 meosc;

int bufsize = 800;

float[] sampArray;
float scrubx = 0.0;
int ranger = 1;
float rangex1 = 0;
float rangex2 = 0;

NetAddress sclang;


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
  sclang = new NetAddress("127.0.0.1", 57120);

  meosc.plug(this, "scrubpos", "/scrubpos");
}

void draw() {
  background(0);
  for (int i=1; i<bufsize; i++) {
    stroke(153, 255, 0);
    line(i-1, 400 - (sampArray[i-1] * 300), i, 400 - (sampArray[i] * 300) );
  }

  //Scrubber
  stroke(255, 0, 255);
  line(scrubx, 300, scrubx, 500);

  //Ranger
  if (ranger==1) {
    noStroke();
    fill(255, 128, 0, 100);
    rect(rangex1, 300, rangex2-rangex1, 200);
  }
}


void oscEvent(OscMessage msg) {

  if ( msg.checkAddrPattern("/sbuf") ) {

    for (int i=0; i<bufsize; i++) {
      sampArray[i] = msg.get(i).floatValue();
    }
  }
}

void scrubpos(float pos) {
  scrubx = pos*bufsize;
}

void mousePressed() {
  rangex1 = mouseX;
}

void mouseDragged() {
  rangex2 = mouseX;
}

void mouseReleased() {
  if (ranger == 1) {
    OscMessage msg1 = new OscMessage("/prange");
    float r1 = norm(rangex1, 0.0, bufsize);
    float r2 = norm(rangex2, 0.0, bufsize);
    msg1.add(r1);
    msg1.add(r2);
    meosc.send(msg1, sclang);
  }
}

void keyPressed() {
  if (key=='1') {
    ranger++;
    ranger = ranger%2;
    if (ranger == 0) {
      OscMessage msg2 = new OscMessage("/prange");
      msg2.add(0.0);
      msg2.add(1.0);
      meosc.send(msg2, sclang);
    }
  }
}

