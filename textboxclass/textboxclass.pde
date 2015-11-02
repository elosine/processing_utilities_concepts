// DECLARE/INITIALIZE CLASS SET
TextBoxSet setOTextBox = new TextBoxSet();


class TextBox {
  // CONSTRUCTOR VARIALBES //
  int ix;
  int x, y, w, h 

    // CLASS VARIABLES //
  String txt = "";
  int bdr = 10;

  // CONSTRUCTORS //
  TextBox(int aix, int ax, int ay, int aw, int ah) {
    ix = aix;
    x = ax;
    y = ay;
    w = aw;
    h = ah;
  } //end constructor 1

  //  DRAW METHOD //
  void drw() {
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(x, y, w, h);

    textAlign(LEFT, CENTER);
    fill(0);
    text(txt, x+bdr, y, w-border, h);
  } //End drw


  //  KEY PRESSED //
  void keyprs() {
    if (keyCode == BACKSPACE) {
      if (txt.length() > 0) {
        txt = txt.substring(0, txt.length()-1);
      }
    } 
    //
    else if (keyCode == DELETE) {
      txt = "";
    } 
    //
    else if (keyCode == RETURN) {
      textentered();
    } 
    //
    else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
      txt = txt + key;
    }
  } //End keyprs


  //  TEXT ENTERED //
  void txtentered() {
    
  } //End txtentered


  //
}  //End class

//// CLASS SET CLASS ////
class TextBoxSet {
  ArrayList<TextBox> cset = new ArrayList<TextBox>();

  // Make Instance Method //
  void mk(int ix) {
    cset.add( new TextBox(ix) );
  } //end mk method

  // Draw Set Method //
  void drwset() {
    for (int i=cset.size ()-1; i>=0; i--) {
      TextBox inst = cset.get(i);
      inst.drw();
    }
  } //end dr method

  // Remove Instance Method //
  void rmv(int ix) {
    for (int i=cset.size ()-1; i>=0; i--) {
      TextBox inst = cset.get(i);
      if (inst.ix == ix) {
        cset.remove(i);
        break;
      }
    }
  } //End rmv method
} //end class set class

