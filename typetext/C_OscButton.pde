// DECLARE/INITIALIZE CLASS SET
OscButtonSet setOOscButton = new OscButtonSet();


class OscButton {
  // CONSTRUCTOR VARIALBES //
  int ix, x, y, sz;
  String name;
  String[] args;

  // CLASS VARIABLES //
  String clrname = "TranquilBlue";
  int r;
  int tlX, tlY, trX, trY, blX, blY, brX, brY;
  boolean showbb = false;


  // CONSTRUCTORS //
  OscButton(int aix, int ax, int ay, int asz, String aname, String[] aargs) {
    ix = aix;
    x = ax;
    y = ay;
    sz = asz;
    name = aname;
    args = aargs;

    r = round(sz/2.0);
    tlX = x - r;
    tlY = y - r;
    trX = x + r;
    trY = y - r;
    blX = x - r;
    blY = y + r; 
    brX = x + r;
    brY = y + r;
  } //end constructor 1

  //  DRAW METHOD //
  void drw() {

    if (showbb) {
      rectMode(CENTER);
      noFill();
      stroke(128);
      rect(x, y, sz, sz);
    }

    ellipseMode(CENTER);
    fill( clr.get(clrname) );
    noStroke();
    ellipse(x, y, sz, sz);
  } //End drw


  //  MOUSE CLICKED METHOD //
  void msclk() {

    if ( mouseX >= tlX && mouseX <= trX && mouseY >= tlY && mouseY <= blY) {
      meosc.send("/" + name, args, sc);
    }
  } //End msclk


  //  MOUSE HOVER METHOD //
  void mshvr() {

    if ( mouseX >= tlX && mouseX <= trX && mouseY >= tlY && mouseY <= blY) {
      showbb = true;
    } else {
      showbb = false;
    }
  } //End msclk


  ////
}  //End class

//// CLASS SET CLASS ////
class OscButtonSet {
  ArrayList<OscButton> cset = new ArrayList<OscButton>();

  // Make Instance Method //
  void mk(int ix, int x, int y, int sz, String name, String[] args) {
    cset.add( new OscButton(ix, x, y, sz, name, args) );
  } //end mk method

  // Draw Set Method //
  void drwset() {
    for (int i=cset.size ()-1; i>=0; i--) {
      OscButton inst = cset.get(i);
      inst.drw();
    }
  } //end dr method

  // Remove Instance Method //
  void rmv(int ix) {
    for (int i=cset.size ()-1; i>=0; i--) {
      OscButton inst = cset.get(i);
      if (inst.ix == ix) {
        cset.remove(i);
        break;
      }
    }
  } //End rmv method
} //end class set class

