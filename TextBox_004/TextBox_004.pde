


PFont font;


 
void setup() {
  size(1024, 768);
  font = loadFont("Monaco-14.vlw");
  textFont(font);
  textSize(14);
  
  clr = new Colors();

}
 
void draw() {
  background(0);
  setOTextBox.drwset();
  
  cs.dr();
  
  setObuttons.drwset();
  
  /*
   // color swatch mouse over behavior //
  if (mouseOver(cs.bl, cs.bt, cs.br, cs.bb)) {
    for (int i=0;i<setOTextBox.cset.size(); i++) {
      TextBox inst = setOTextBox.cset.get(i);
      if (inst.active) {
        inst.crvclr = clr.get(cs.msovrname);
        bz.clrname = cs.msovrname;
        bz.clrnum = cs.msovernum;
      }
    }
  }
  */
 
}

void keyPressed(){
  setOTextBox.keyprs();
  setObuttons.keyprs();
}

void mousePressed(){
  setOTextBox.msclk();
  setObuttons.msclk();
}

void mouseDragged(){
  setOTextBox.msdrg();
  setObuttons.msdrg();
}
