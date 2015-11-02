// DECLARE/INITIALIZE CLASS SET
NewclassSet newclassz = new NewclassSet();

/**
 *
 *
 /// PUT IN SETUP ///
 meosc.plug(newclassz, "mk", "/mknewclass");
 meosc.plug(newclassz, "rmv", "/rmvnewclass");
 meosc.plug(newclassz, "rmvall", "/rmvallnewclass");
 
 /// PUT IN DRAW ///
 newclassz.drw();
 *
 *
 */


class Newclass {

  // CONSTRUCTOR VARIALBES //
  PApplet ap;
  int ix, x, y, w, h;

  // CLASS VARIABLES //
  int l, t, r, b, m, c;


  // CONSTRUCTORS //

  /// Constructor 1 ///
  Newclass(PApplet aap, int aix, int ax, int ay, int aw, int ah) {
    ap = app;
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
  } //end constructor 1


  //  DRAW METHOD //
  void drw() {
  } //End drw


    //// MOUSE METHODS ////

  // Mouse Clicked Method // - When mouse is pressed and then released
  void msclk() {
  }//end msclk method


  // Mouse Pressed Method //
  void msprs() {
  }//end msprs method


  // Mouse Released Method //
  void msrel() {
  }//end msrel method


  // Mouse Moved Method //
  void msmv() {
  }//end msmv method


  // Mouse Dragged Method //
  void msdrg() {
  }//end msdrg method


  // Mouse Wheel Method //
  void mswl() {
  }//end mswl method



  //// KEYBOARD METHODS ////

  // Key Pressed Method //
  void keyprs() {
  }//end keyprs method


  // Key Released Method //
  void keyrel() {
  }//end keyrel method
  //
  //
  //
}  //End class



////////////////////////////////////////////////////////////
/////////////   CLASS SET     //////////////////////////////
////////////////////////////////////////////////////////////

class NewclassSet {
  ArrayList<Newclass> cset = new ArrayList<Newclass>();

  // Make Instance Method //
  void mk(int ix, int x, int y, int w, int h) {
    cset.add( new Newclass(ix, x, y, w, h) );
  } //end mk method


  // Remove Instance Method //
  void rmv(int ix) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Newclass inst = cset.get(i);
      if (inst.ix == ix) {
        cset.remove(i);
        break;
      }
    }
  } //End rmv method


  // Remove All Method //
  void rmvall() {
    cset.clear();
  } //End rmvall method


  // Draw Set Method //
  void drw() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Newclass inst = cset.get(i);
      inst.drw();
    }
  }//end drw method


  //// CHANGE METHODS ////

  // Change Method //
  void chg(int ix, int var) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Newclass inst = cset.get(i);
      if (inst.ix == ix) {
        inst.var = var;
        //Actions or Calculations Here:

        ///////////////////////////////
        break;
      }
    }
  } //End chg method


  //// MOUSE METHODS ////

  // Mouse Clicked Method // - When mouse is pressed and then released
  void msclk() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Newclass inst = cset.get(i);
      inst.msclk();
    }
  }//end msclk method


  // Mouse Pressed Method //
  void msprs() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Newclass inst = cset.get(i);
      inst.msprs();
    }
  }//end msprs method


  // Mouse Released Method //
  void msrel() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Newclass inst = cset.get(i);
      inst.msrel();
    }
  }//end msrel method


  // Mouse Moved Method //
  void msmv() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Newclass inst = cset.get(i);
      inst.msmv();
    }
  }//end msmv method


  // Mouse Dragged Method //
  void msdrg() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Newclass inst = cset.get(i);
      inst.msdrg();
    }
  }//end msdrg method


  // Mouse Wheel Method //
  void mswl() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Newclass inst = cset.get(i);
      inst.mswl();
    }
  }//end mswl method



  //// KEYBOARD METHODS ////

  // Key Pressed Method //
  void keyprs() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Newclass inst = cset.get(i);
      inst.keyprs();
    }
  }//end keyprs method


  // Key Released Method //
  void keyrel() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Newclass inst = cset.get(i);
      inst.keyrel();
    }
  }//end keyrel method
  //
  //
} // END CLASS SET CLASS







