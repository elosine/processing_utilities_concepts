

class GuiGui {
  int x, y, w, h;
  String mode;

  ColorSwatch cs;
  int tbl, tbt, tbr, tbb;
  int tbw = 100;
  int tbh = 30;
  String tbmfclr = "dodgerblue";
  String tbmsclr = "sunshine";
  String tbmtclr = "white";
  String tbmhclr = "orange";

  boolean tbms = false;
  boolean tbmf = false;
  boolean tbmt = false;
  boolean tbmh = false;
  boolean tbmactive = false;
  boolean tbmsh = false;
  boolean tbmfh = false;
  boolean tbmth = false;
  boolean tbmhh = false;

  boolean mktbmactive = false;

  boolean neuf = true;
  boolean activetb = false;
  int activetbnum = 0;


  GuiGui(int ax, int ay, int aw, int ah, String amode) {
    x = ax;
    y = ay;
    w = aw;
    h = ah;
    mode = amode;

    cs = new ColorSwatch(x, y, floor(w/25), 25);
    if (mode.equals("v")) {
      tbl = x+2;
      tbt = cs.bb+16;
      tbr = tbl + tbw;
      tbb = tbt + tbh;
    }
  }

  void drw() {
    cs.dr();
    //TEXT BOX MAKER
    rectMode(CORNER);
    strokeWeight(3);
    stroke(clr.get(tbmsclr));
    if (!tbmactive) fill(clr.get(tbmfclr));
    else fill(clr.get(tbmhclr));
    rect(tbl, tbt, tbw, tbh);
    textAlign(CENTER, CENTER);
    fill(clr.get(tbmtclr));
    text("Text Box", tbl, tbt, tbw, tbh);

    //text box stroke
    if (!tbms) noStroke();
    else stroke(clr.get("red"));
    fill(clr.get(tbmsclr));
    rect(tbl, tbb+8, 25, 25);
    //text box fill
    if (!tbmf) noStroke();
    else stroke(clr.get("red"));
    fill(clr.get(tbmfclr));
    rect(tbl+33, tbb+8, 25, 25);
    //text color
    if (!tbmt) noStroke();
    else stroke(clr.get("red"));
    fill(clr.get(tbmtclr));
    rect(tbl+66, tbb+8, 25, 25);
    //highlight color
    if (!tbmh) noStroke();
    else stroke(clr.get("red"));
    fill(clr.get(tbmhclr));
    rect(tbl+99, tbb+8, 25, 25);

    if (mouseOver(tbl, tbt, tbr, tbb)) tbmactive = true;
    else if (!mktbmactive) tbmactive = false;
    if (mouseOver(tbl, tbb+8, tbl+25, tbb+8+25)) tbms = true;
    else if (!tbmsh) tbms = false;
    if (mouseOver(tbl+33, tbb+8, tbl+33+25, tbb+8+25)) tbmf = true;
    else if (!tbmfh) tbmf = false;
    if (mouseOver(tbl+66, tbb+8, tbl+66+25, tbb+8+25)) tbmt = true;
    else if (!tbmth) tbmt = false;
    if (mouseOver(tbl+99, tbb+8, tbl+99+25, tbb+8+25)) tbmh = true;
    else if (!tbmhh) tbmh = false;

    if (mousePressed) {
      if (tbms) tbmsh = true;
      if (tbmf) tbmfh = true;
      if (tbmt) tbmth = true;
      if (tbmh) tbmhh = true;


      if (tbmsh) {
        if (mouseOver(cs.bl, cs.bt, cs.br, cs.bb)) {
          tbmsclr = cs.msovrname;
          tbmsh = false;
          tbms = false;
        }
      }
      if (tbmfh) {
        if (mouseOver(cs.bl, cs.bt, cs.br, cs.bb)) {
          tbmfclr = cs.msovrname;
          tbmfh = false;
          tbmf = false;
        }
      }
      if (tbmth) {
        if (mouseOver(cs.bl, cs.bt, cs.br, cs.bb)) {
          tbmtclr = cs.msovrname;
          tbmth = false;
          tbmt = false;
        }
      }
      if (tbmhh) {
        if (mouseOver(cs.bl, cs.bt, cs.br, cs.bb)) {
          tbmhclr = cs.msovrname;
          tbmhh = false;
          tbmh = false;
        }
      }

      if (neuf) {
        if (mktbmactive) {
          setOTextBox.mkclr(setOTextBox.cset.size(), mouseX, mouseY, 100, 50, tbmsclr, tbmfclr, tbmtclr, tbmhclr);
          mktbmactive = false;
        }
      } else if (activetb) {
        if (mktbmactive) {
          TextBox inst = setOTextBox.cset.get(activetbnum);
          inst.bdrclr = tbmsclr;
          inst.fillclr = tbmfclr;
          inst.txtclr = tbmtclr;
          inst.highlightclr = tbmhclr;

          mktbmactive = false;
          activetb = false;
          neuf = true;
        }
      }
    }

    //
  }


  void msrel() {

    if (tbmactive) mktbmactive = true;
  }




  //setObuttons.mk(0, 300, 300, 50, 50);


  // setOTextBox.mk(0, 100, 100, 200, 50);
}



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
