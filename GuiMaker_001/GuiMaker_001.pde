


PFont font;
GuiGui gg;

 
void setup() {
  size(1024, 768);
  font = loadFont("Monaco-14.vlw");
  textFont(font);
  textSize(14);
  
  clr = new Colors();
  gg = new GuiGui(width - 200, 0, 200, height, "v");

}
 
void draw() {
  background(0);
  setOTextBox.drwset();
  setObuttons.drwset();
  gg.drw();
  
 
}

void keyPressed(){
  setOTextBox.keyprs();
  setObuttons.keyprs();
}

void mousePressed(){
  setOTextBox.msclk();
  setObuttons.msclk();
}

void mouseDragged(){
  setOTextBox.msdrg();
  setObuttons.msdrg();
}

void mouseReleased(){
  gg.msrel();
}
