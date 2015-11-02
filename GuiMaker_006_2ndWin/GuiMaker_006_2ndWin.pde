
import java.awt.Frame;
PFrame f;
secondApplet s;
int w = 1024;
int h = 768;
PFont font;
GuiGui gg;

 
void setup() {
  size(1024, 768);
  
 PFrame f = new PFrame();
  
  font = loadFont("Monaco-14.vlw");
  textFont(font);
  textSize(14);
  
  clr = new Colors();
  gg = new GuiGui(s.width - 200, 0, 200, s.height, "v");

}
 
void draw() {
  background(0);
  setOTextBox.drwset();
  setObuttons.drwset();
  
   s.background(0);
  
  gg.drw();
   s.redraw();
  
 
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
  setOTextBox.msrel();
  gg.msrel();
}


int x = 500;
int y = 500;




public class PFrame extends Frame {
    public PFrame() {
        setBounds(100, 100, 300, h);
        setLocation(1350, 0);
        s = new secondApplet();
        add(s);
        s.init();
        show();
    }
}

public class secondApplet extends PApplet {
    public void setup() {
        size(300, h);
        noLoop();
    }

    public void draw() {
    }

}



