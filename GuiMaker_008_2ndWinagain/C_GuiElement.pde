class GuiElement {
  // CONSTRUCTOR VARIALBES //
  int ix, x, y, w, h;

  // CLASS VARIABLES //
  int bbBdrWt = 3;
  int bdrwt = 0;
  int bbinset;

  int l, r, t, b, m, c;
  int rx, ry, rw, rh;

  String bdrclr = "orange";
  String bbbdrclr = "orange";
  String bbfillclr = "sunshine";
  String fillclr = "indigo";
  String highlightclr = "mint";

  boolean active = false;
  boolean resize = false;
  boolean bbactive = false;
  boolean highlightactive = false;
  boolean chgbdrclr = false;
  boolean chgfillclr = false;
  boolean chgtxtclr = false;
  boolean chghighlightclr = false;

  // CONSTRUCTORS //
  GuiElement(int aix, int ax, int ay, int aw, int ah) {
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
    bbinset = ceil(bbBdrWt/2.0);
    rx = x+bbinset;
    ry = y+bbinset;
    rw = w - (bbinset*2);
    rh = h - (bbinset*2);
  } //end constructor 1

  //  BOUNDING BOX METHOD //
  void bb() {
    rectMode(CORNER);
    if (bbactive) {
      if (bbBdrWt == 0) noStroke();
      else stroke(clr.get(bbbdrclr));
      strokeWeight(bbBdrWt);
      if (bbfillclr.equals("none")) noFill();
      else fill(clr.get(bbfillclr));
      rect(rx, ry, rw, rh);
    }
  }

  void fillstroke() {
    rectMode(CORNER);
    ellipseMode(CORNER);
    if (bdrwt == 0) noStroke();
    else stroke(clr.get(bdrclr));
    strokeWeight(bdrwt);
    if (fillclr.equals("none")) noFill();
    else fill(clr.get(fillclr));
  }
  
  void highlight(){
    if (highlightactive) fill(clr.get(highlightclr));
  }

  void resizesqr() {
    //RESIZE SQUARE
    if (mouseOver( r-15, b-15, r, b)) {
      noStroke();
      fill(128);
      rect(r-15, b-15, 14, 14);
    }
  }



  //  Axtivate //
  void activate() {
    if (mouseOver( l, t, r, b)) active = true;
    else active = false;
  } //End msclk

  void drag() {
    //MOVE BOX
    if ( mouseOver( l, t, r, b)) {
      if (active) {
        if (!resize) {
          //BOUNDING BOX COORDINATES
          x = x + (mouseX - pmouseX);
          y = y + (mouseY - pmouseY);
          l = x;
          t = y;
          r = l+w;
          b = t+h;
          m = l + round(w/2.0);
          c = t + round(h/2.0);
          //RECT COORDINATES
          rx = x+bbinset;
          ry = y+bbinset;
        }
      }
    }
  }

  void resiz(int mode) {
    //RESIZE
    
    if ( mouseOver( r-15, b-15, r, b)) {
      if(active){
      resize = true;
      //BOUNDING BOX COORDINATES
      w = w + (mouseX - pmouseX);
      h = h + (mouseY - pmouseY);
      if (mode == 1) h = w;
      else h = h + (mouseY - pmouseY);

      r = l+w;
      b = t+h;
      m = l + round(w/2.0);
      c = t + round(h/2.0);

      //RECT COORDINATES
      rw = w - (bbinset*2);
      rh = h - (bbinset*2);
      }
    } else resize = false;
  } //end msdrrg



  //
}  //End class

