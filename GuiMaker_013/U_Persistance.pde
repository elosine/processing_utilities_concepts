
void store(String filename) {
  boolean storegate = false;
  String guidata = "data/" + filename + ".txt";
  String[] guidataArray = new String[0];
  int ver = 1;

  if (key == 'a') {
    for (int i=0; i<setOTextBox.cset.size (); i++) {
      TextBox itb = setOTextBox.cset.get(i);
      // string identifying GUI object
      // /objname, applet, ix, x, y, w, h, bdrclr, fillclr, txtclr, highlightclr



      String tbstr = "/tb" + " " + "main" + " " + str(itb.ix) + " " + str(itb.x) + " "  + str(itb.y) 
        + " " + str(itb.w) + " " + str(itb.h) + " " + itb.bdrclr + " " + itb.fillclr + " " + itb.txtclr + " " + itb.highlightclr;
      guidataArray = append(guidataArray, tbstr);
    }
  }

  while (!storegate) {
String[] loc = null;
loc = loadStrings(guidata);

    if (loc == null) {

      saveStrings(guidata, guidataArray); 
      storegate = true; 
      
    } else { 
      guidata = filename + str(ver) + ".txt";
    }
  }
}

