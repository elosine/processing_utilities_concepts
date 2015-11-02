import java.awt.Frame;
import java.awt.BorderLayout;
 
ControlFrame cf;
 
int def;
Test tee;
 
void setup() {
  size(200, 200 );
  cf = addControlFrame("widow2", 200, 200);
  tee = new Test(cf);
  
}
 
void draw() {
  background(255, 0, 0);
  text("window 1", width/2, height/2);
}

public class Test{
  final PApplet p;
  Test(PApplet pa){
    p = pa;
  }
  void dr(){
    p.noStroke();
    p.fill(0,255,0);
    p.ellipse(10, 10, 50, 50);
    
  }
}

 
ControlFrame addControlFrame(String theName, int theWidth, int theHeight) {
  Frame f = new Frame(theName);
  ControlFrame p = new ControlFrame(this, theWidth, theHeight);
  f.add(p);
  p.init();
  f.setTitle(theName);
  f.setSize(p.w, p.h);
  f.setLocation(900, 100);
  f.setResizable(false);
  f.setVisible(true);
  return p;
}
 
public class ControlFrame extends PApplet {
 
  int w, h;
 
  int abc = 100;
 
  public void setup() {
    size(w, h);
      tee = new Test(this);

  }
 
  public void draw() {
    background(255);
    tee.dr();
    fill(0); // weird, I have to add this to fill the ellipse…
    ellipse(width/2, height/2, 30, 30);
    ellipse(100, 100, 30, 30); // It draws the ellipse in other position!!!!
    this.text("window 2", width/2, height/2+70);
  }
  private ControlFrame() {
  }
 
  public ControlFrame(Object theParent, int theWidth, int theHeight) {
    parent = theParent;
    w = theWidth;
    h = theHeight;
  }
 
 
  Object parent;
}






