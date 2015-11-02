// DECLARE/INITIALIZE CLASS SET
TextBoxSet setOTextBox = new TextBoxSet();


class TextBox {
  // CONSTRUCTOR VARIALBES //
  int ix;
  int x, y, w, h;

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
    text(txt, x+bdr, y, w-bdr, h);
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
    else if (keyCode == ENTER) {
      txtentered();
      println("enter");
    } 
    //
    else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
      txt = txt + key;
    }
  } //End keyprs


  //  TEXT ENTERED //
  void txtentered() {
    String[] argset = split(txt, " ");
    String[] args = subset(argset, 1);
    setOOscButton.mk(bix, 100, bloc, 50, argset[0], args);
    bix++;
    bloc += bloc;
    println("method");
  } //End txtentered


  //
}  //End class

//// CLASS SET CLASS ////
class TextBoxSet {
  ArrayList<TextBox> cset = new ArrayList<TextBox>();

  // Make Instance Method //
  void mk(int ix, int x, int y, int w, int h) {
    cset.add( new TextBox(ix, x, y, w, h) );
  } //end mk method

  // Draw Set Method //
  void drwset() {
    for (int i=cset.size ()-1; i>=0; i--) {
      TextBox inst = cset.get(i);
      inst.drw();
    }
  } //end dr method

  // Draw Set Method //
  void keyprs() {
    for (int i=cset.size ()-1; i>=0; i--) {
      TextBox inst = cset.get(i);
      inst.keyprs();
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

