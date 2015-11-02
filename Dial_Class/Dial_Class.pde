import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress oscdest;

int editct = 1;

void setup() {
  size(500, 500);  
  osc = new OscP5(this, 12321);
  oscdest = new NetAddress("127.0.0.1", 57120);
  osc.plug(dialset, "setdval", "/setdval");
  osc.plug(dialset, "setdset", "/setdset");
}

void draw() {
  background(0);
  setOTextBox.drwset();
  dialset.drw();
}

void keyPressed() {
  dialset.keyprs();
  if (key=='d') {
    dialset.mk(dialix, 200, 200);
    dialix++;
  }
  if (key=='r') {
    for(int i=0;i<dialset.cset.size();i++){
      Dial inst = dialset.cset.get(i);
      if(mouseX>inst.l && mouseX<inst.r && mouseY>inst.t && mouseY<inst.b){
        setOTextBox.rmv(inst.tbix[0]);
        setOTextBox.rmv(inst.tbix[1]);
        setOTextBox.rmv(inst.tbix[2]);
        dialset.cset.remove(i);
      }
    }
  }
}

void mousePressed() {
  setOTextBox.msclk();
  dialset.msprs();
}

void mouseDragged() {
  setOTextBox.msdrg();
  dialset.msdrg();
}

void mouseReleased() {
  dialset.msrel();
}

void keyReleased() { 
  setOTextBox.keyrel();
  dialset.keyrel();
}




//COPY CLASSES INTO OWN FILES

