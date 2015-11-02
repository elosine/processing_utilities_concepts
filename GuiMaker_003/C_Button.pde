  ButtonSet setObuttons = new ButtonSet(); 

class Button extends GuiElement {
  Button(int aix, int ax, int ay, int aw, int ah) {
    super(aix, ax, ay, aw, ah);
    bbactive = true;
  }

  void drw() {
    if (active) super.bb();
    super.fillstroke();
    ellipse(l, t, w, h);
    super.resizesqr();
  }

  void keyprs() {
  }

  void msclk() {
    super.activate();
  }

  void msdrg() {
    super.drag();
    super.resiz(1);
  }
}


//// CLASS SET CLASS ////
class ButtonSet {
  ArrayList<Button> cset = new ArrayList<Button>();

  // Make Instance Method //
  void mk(int ix, int x, int y, int w, int h) {
    cset.add( new Button(ix, x, y, w, h) );
  } //end mk method

  // Draw Set Method //
  void drwset() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Button inst = cset.get(i);
      inst.drw();
    }
  } //end dr method

  // Key Pressed Set Method //
  void keyprs() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Button inst = cset.get(i);
      inst.keyprs();
    }
  } //end keyprs method

  // Mouse Pressed Set Method //
  void msclk() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Button inst = cset.get(i);
      inst.msclk();
    }
  } //end msclk method

  // Mouse Dragged Set Method //
  void msdrg() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Button inst = cset.get(i);
      inst.msdrg();
    }
  } //end msmvd method

  // Remove Instance Method //
  void rmv(int ix) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Button inst = cset.get(i);
      if (inst.ix == ix) {
        cset.remove(i);
        break;
      }
    }
  } //End rmv method
} //end class set class

