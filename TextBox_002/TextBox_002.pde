


PFont font;


 
void setup() {
  size(500, 500);
  font = loadFont("Monaco-14.vlw");
  textFont(font);
  textSize(14);
  
  clr = new Colors();

  
  setOTextBox.mk(0, 100, 100, 200, 50);
}
 
void draw() {
  background(0);
  setOTextBox.drwset();
 
}

void keyPressed(){
  setOTextBox.keyprs();
}

void mousePressed(){
  setOTextBox.msclk();
}

void mouseDragged(){
  setOTextBox.msdrg();
}
