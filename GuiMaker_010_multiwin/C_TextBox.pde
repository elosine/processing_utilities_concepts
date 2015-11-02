// DECLARE/INITIALIZE CLASS SET
TextBoxSet setOTextBox = new TextBoxSet();

class TextBox {
  // CONSTRUCTOR VARIALBES //
  PApplet p;
  int ix, x, y, w, h;

  // CLASS VARIABLES //
  String txt = "";
  int borderweight = 3;
  int textinset = 6;
  int bbinset;
  String just = "l";
  String align = "t";

  int l, r, t, b, m, c;
  int rx, ry, rw, rh;
  int tx, ty, tw, th;

  String bdrclr = "orange";
  String fillclr = "indigo";
  String txtclr = "black";
  String highlightclr = "mint";

  boolean active = false;
  boolean resize = false;
  boolean chgbdrclr = false;
  boolean chgfillclr = false;
  boolean chgtxtclr = false;
  boolean chghighlightclr = false;

  // CONSTRUCTORS //
  TextBox(PApplet ap, int aix, int ax, int ay, int aw, int ah) {
    p = ap;
    ix = aix;
    x = ax;
    y = ay;
    w = aw;
    h = ah;

    //BOUNDING BOX COORDINATES
    l = x;
    t = y;
    r = l+w;
    b = t+h;
    m = l + round(w/2.0);
    c = t + round(h/2.0);

    //RECT COORDINATES
    bbinset = ceil(borderweight/2.0);
    rx = x+bbinset;
    ry = y+bbinset;
    rw = w - (bbinset*2);
    rh = h - (bbinset*2);

    //TEXT COORDINATES
    textinset = textinset + ceil(borderweight/2.0);

    tx = rx + textinset;
    ty = ry + textinset;
    tw = rw - (textinset*2);
    th = rh - (textinset*2);
  } //end constructor 1

  //Constructor 2
  TextBox(PApplet ap, int aix, int ax, int ay, int aw, int ah, String abdrclr, String afillclr, String atxtclr, String ahighlightclr) {
    p = ap;
    ix = aix;
    x = ax;
    y = ay;
    w = aw;
    h = ah;
    bdrclr = abdrclr;
    fillclr = afillclr;
    txtclr = atxtclr;
    highlightclr = ahighlightclr;

    //BOUNDING BOX COORDINATES
    l = x;
    t = y;
    r = l+w;
    b = t+h;
    m = l + round(w/2.0);
    c = t + round(h/2.0);

    //RECT COORDINATES
    bbinset = ceil(borderweight/2.0);
    rx = x+bbinset;
    ry = y+bbinset;
    rw = w - (bbinset*2);
    rh = h - (bbinset*2);

    //TEXT COORDINATES
    textinset = textinset + ceil(borderweight/2.0);

    tx = rx + textinset;
    ty = ry + textinset;
    tw = rw - (textinset*2);
    th = rh - (textinset*2);
  } //end constructor 2



    //  DRAW METHOD //
  void drw() {
    p.rectMode(CORNER);

    //WHITE BACKGROUND RECT
    p.noStroke();
    p.fill(255);
    p.rect(rx, ry, rw, rh);

    //BOX FILL RECT
    if (borderweight == 0) p.noStroke();
    else p.stroke(clr.get(bdrclr));
    p.strokeWeight(borderweight);
    if (active) p.fill(clr.get(highlightclr));
    else p.fill(clr.get(fillclr));
    p.rect(rx, ry, rw, rh);

    //RESIZE SQUARE
    if (p.mouseX >= r-25 && p.mouseX <= r+10 && p.mouseY >= b-25 && p.mouseY <= b+10 && active) {
      noStroke();
      fill(128);
      rect(r-20, b-20, 18, 18);
    }


    //SET TEXT ALIGNMENT
    if (just.equals("l")&&align.equals("t")) p.textAlign(LEFT, TOP);
    if (just.equals("l")&&align.equals("c")) p.textAlign(LEFT, CENTER);
    if (just.equals("l")&&align.equals("b")) p.textAlign(LEFT, BOTTOM);
    if (just.equals("c")&&align.equals("t")) p.textAlign(CENTER, TOP);
    if (just.equals("c")&&align.equals("c")) p.textAlign(CENTER, CENTER);
    if (just.equals("c")&&align.equals("b")) p.textAlign(CENTER, BOTTOM);
    if (just.equals("r")&&align.equals("t")) p.textAlign(RIGHT, TOP);
    if (just.equals("r")&&align.equals("c")) p.textAlign(RIGHT, CENTER);
    if (just.equals("r")&&align.equals("b")) p.textAlign(RIGHT, BOTTOM);
    p.fill(clr.get(txtclr));
    p.text(txt, tx, ty, tw, th);
  } //End drw


  //  KEY PRESSED //
  void keyprs() {
    if (active) {
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
        txtentered();
      } 
      //
      else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
        txt = txt + key;
      }
    }
  } //End keyprs

  //  Mouse Pressed //
  void msclk() {

    if (  mouseOver(p, l, t, r, b) ) {
      active = true;

      gg.activetbnum = ix;
    
    } else if (mouseOver(p, gg.l, gg.t, gg.r, gg.b) == false) {
      active = false;
       gg.activetbnum = -1;
    }

  } //End msclk

  void msdrg() {
    //MOVE BOX
    if ( p.mouseX >= l && p.mouseX <= r && p.mouseY >= t && p.mouseY <= b && active) {
      if (!resize) {
        //BOUNDING BOX COORDINATES
        x = x + (p.mouseX - p.pmouseX);
        y = y + (p.mouseY - p.pmouseY);
        l = x;
        t = y;
        r = l+w;
        b = t+h;
        m = l + round(w/2.0);
        c = t + round(h/2.0);
        //RECT COORDINATES
        rx = x+bbinset;
        ry = y+bbinset;
        //TEXT COORDINATES
        tx = rx + textinset;
        ty = ry + textinset;
      }
    }

    //RESIZE
    if ( p.mouseX >= r-30 && p.mouseX <= r+20 && p.mouseY >= b-30 && p.mouseY <= b+20 && active) {
      resize = true;
      //BOUNDING BOX COORDINATES
      w = w + (p.mouseX - p.pmouseX);
      h = h + (p.mouseY - p.pmouseY);

      r = l+w;
      b = t+h;
      m = l + round(w/2.0);
      c = t + round(h/2.0);

      //RECT COORDINATES
      rw = w - (bbinset*2);
      rh = h - (bbinset*2);

      //TEXT COORDINATES
      tw = rw - (textinset*2);
      th = rh - (textinset*2);
    } else resize = false;
  } //end msdrg

  void msrel() {
    if (active) {
      gg.activetbnum = ix;
      gg.neuf = false;
      println("active"+active);
    } else {
      gg.neuf = true;
    }
  }
  //  TEXT ENTERED //
  void txtentered() {
  } //End txtentered


    //
}  //End class

//// CLASS SET CLASS ////
class TextBoxSet {
  ArrayList<TextBox> cset = new ArrayList<TextBox>();

  // Make Instance Method //
  void mk(PApplet p, int ix, int x, int y, int w, int h) {
    cset.add( new TextBox(p, ix, x, y, w, h) );
  } //end mk method

  // Make With Color Arguments //
  void mkclr(PApplet p, int ix, int x, int y, int w, int h, String s, String f, String t, String hi) {
    cset.add( new TextBox(p, ix, x, y, w, h, s, f, t, hi) );
  } //end mk method

  // Draw Set Method //
  void drwset() {
    for (int i=cset.size ()-1; i>=0; i--) {
      TextBox inst = cset.get(i);
      inst.drw();
    }
  } //end dr method

  // Key Pressed Set Method //
  void keyprs() {
    for (int i=cset.size ()-1; i>=0; i--) {
      TextBox inst = cset.get(i);
      inst.keyprs();
    }
  } //end keyprs method

  // Mouse Pressed Set Method //
  void msclk() {
    for (int i=cset.size ()-1; i>=0; i--) {
      TextBox inst = cset.get(i);
      inst.msclk();
    }
  } //end msclk method

  // Mouse Dragged Set Method //
  void msdrg() {
    for (int i=cset.size ()-1; i>=0; i--) {
      TextBox inst = cset.get(i);
      inst.msdrg();
    }
  } //end msmvd method

  // Mouse Released Set Method //
  void msrel() {
    for (int i=cset.size ()-1; i>=0; i--) {
      TextBox inst = cset.get(i);
      inst.msrel();
    }
  } //end msrel method

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

