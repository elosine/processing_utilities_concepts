
PApplet main;
int w = 1024;
int h = 768;
PFont font;
GuiGui gg;


void setup() {
  main = this;
  size(w, h);
  PFrame frame2 = new PFrame();
  font = loadFont("Monaco-14.vlw");
  textFont(font);
  textSize(14);

  clr = new Colors();
  gg = new GuiGui(applet2, 100, 0, 200, h, "v");
}

void draw() {
  background(0);
  setOTextBox.drwset();
  setObuttons.drwset();

  //WINDOW 2 DRAW
  applet2.background(clr.get("pine"));

  gg.drw();
  applet2.redraw();
}

void keyPressed() {
  setOTextBox.keyprs();
  setObuttons.keyprs();
}

void mousePressed() {
  setOTextBox.msclk();
  setObuttons.msclk();
}

void mouseDragged() {
  setOTextBox.msdrg();
  setObuttons.msdrg();
}

void mouseReleased() {
  setOTextBox.msrel();
  
}



