import java.awt.Frame;
PFrame frame2;
SecondApplet applet2;

int w2x = 1400;
int w2y = 0;
int w2w = 300;
int w2h = h;

public class PFrame extends Frame {
  public PFrame() {
    setBounds(w2x, w2y, w2w, w2h);
    //setLocation(x,y);
    applet2 = new SecondApplet();
    add(applet2);
    applet2.init();
    show();
  }
}

public class SecondApplet extends PApplet {
  public void setup() {
    size(w2w, w2h);
    noLoop();
  }

  public void draw() {
  }

  public void mouseReleased() {

  setOTextBox.msrel();
    gg.msrel();
  }
}
