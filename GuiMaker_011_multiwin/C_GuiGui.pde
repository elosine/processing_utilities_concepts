

class GuiGui {
  PApplet p;
  int x, y, w, h;
  String mode;

  int l, t, r, b;
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
  int activetbnum = -1;


  GuiGui(PApplet ap, int ax, int ay, int aw, int ah, String amode) {
    p = ap;
    x = ax;
    y = ay;
    w = aw;
    h = ah;
    mode = amode;

    l = x;
    t = y;
    r = l+w;
    b = t+h;

    cs = new ColorSwatch(applet2, x, y, floor(w/25), 25);
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
    p.rectMode(CORNER);
    p.strokeWeight(3);
    p.stroke(clr.get(tbmsclr));
    if (!tbmactive) p.fill(clr.get(tbmfclr));
    else p.fill(clr.get(tbmhclr));
    p.rect(tbl, tbt, tbw, tbh);
    p.textAlign(CENTER, CENTER);
    p.fill(clr.get(tbmtclr));
    p.text("Text Box", tbl, tbt, tbw, tbh);

    //text box stroke
    if (!tbms) p.noStroke();
    else p.stroke(clr.get("red"));
    p.fill(clr.get(tbmsclr));
    p.rect(tbl, tbb+8, 25, 25);
    //text box fill
    if (!tbmf) p.noStroke();
    else p.stroke(clr.get("red"));
    p.fill(clr.get(tbmfclr));
    p.rect(tbl+33, tbb+8, 25, 25);
    //text color
    if (!tbmt) p.noStroke();
    else p.stroke(clr.get("red"));
    p.fill(clr.get(tbmtclr));
    p.rect(tbl+66, tbb+8, 25, 25);
    //highlight color
    if (!tbmh) p.noStroke();
    else p.stroke(clr.get("red"));
    p.fill(clr.get(tbmhclr));
    p.rect(tbl+99, tbb+8, 25, 25);

    if (mouseOver(p, tbl, tbt, tbr, tbb)) tbmactive = true;
    else if (!mktbmactive) tbmactive = false;

    if (mouseOver(p, tbl, tbb+8, tbl+25, tbb+8+25)) tbms = true;
    else if (!tbmsh) tbms = false;
    if (mouseOver(p, tbl+33, tbb+8, tbl+33+25, tbb+8+25)) tbmf = true;
    else if (!tbmfh) tbmf = false;
    if (mouseOver(p, tbl+66, tbb+8, tbl+66+25, tbb+8+25)) tbmt = true;
    else if (!tbmth) tbmt = false;
    if (mouseOver(p, tbl+99, tbb+8, tbl+99+25, tbb+8+25)) tbmh = true;
    else if (!tbmhh) tbmh = false;

    if (p.mousePressed) {
      if (tbms) tbmsh = true;
      if (tbmf) tbmfh = true;
      if (tbmt) tbmth = true;
      if (tbmh) tbmhh = true;


      if (tbmsh) {
        if (mouseOver(p, cs.bl, cs.bt, cs.br, cs.bb)) {
          tbmsclr = cs.msovrname;
          tbmsh = false;
          tbms = false;
        }
      }
      if (tbmfh) {
        if (mouseOver(p, cs.bl, cs.bt, cs.br, cs.bb)) {
          tbmfclr = cs.msovrname;
          tbmfh = false;
          tbmf = false;
        }
      }
      if (tbmth) {
        if (mouseOver(p, cs.bl, cs.bt, cs.br, cs.bb)) {
          tbmtclr = cs.msovrname;
          tbmth = false;
          tbmt = false;
        }
      }
      if (tbmhh) {
        if (mouseOver(p, cs.bl, cs.bt, cs.br, cs.bb)) {
          tbmhclr = cs.msovrname;
          tbmhh = false;
          tbmh = false;
        }
      }
    }
    if (main.mousePressed) {
      if (mktbmactive) {
        println(main.mouseX);
        setOTextBox.mkclr(main, setOTextBox.cset.size(), main.mouseX, main.mouseY, 100, 50, tbmsclr, tbmfclr, tbmtclr, tbmhclr);
        mktbmactive = false;
      }
    }
    //
  }


  void msrel() {
    if (activetbnum<0) {
      if (tbmactive) {
        mktbmactive = true;
      }
    } else {
      TextBox inst = setOTextBox.cset.get(activetbnum);
      if (tbmactive) {
        inst.bdrclr = tbmsclr;
        inst.fillclr = tbmfclr;
        inst.txtclr = tbmtclr;
        inst.highlightclr = tbmhclr; 

        inst.active = false;
        activetbnum = -1;
      }
    }

    println("neuf" + neuf);
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
