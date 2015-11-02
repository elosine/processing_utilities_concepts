import controlP5.*;
// uses processing 2.1 and controlp5 2.0.4
ControlP5 cp5;
 
void setup() {
  size(800, 400);
 
  cp5 = new ControlP5(this);
  cp5.addButton("my-button").setPosition(100,100).addCallback(  
  new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.ACTION_PRESSED):
        println("send MIDI on press, note on.");
        break;
        case(ControlP5.ACTION_RELEASED):
        case(ControlP5.ACTION_RELEASEDOUTSIDE):
        println("send MIDI on release, note off.");
        break;
      }
    }
  }
  );
 
}
 
void draw() {
}
