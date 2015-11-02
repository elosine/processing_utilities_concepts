import fisica.*;

String msg = "";
FWorld world;
PFont font;

String[] manifesto;
String[] empty = {
  ""
};
int linenum = 0;
String manifestoname = "text.txt";

void setup() {
  size(600, 600);
  smooth();

  Fisica.init(this);

  font = loadFont("FreeMonoBold-24.vlw");
  textFont(font, 24);

  world = new FWorld();
  world.setEdges(this, color(120));
  world.remove(world.bottom);
  world.setGravity(0, -500);


  //defines the (lack of) path and filename

  if (loadStrings(manifestoname) == null) {       
    saveStrings(manifestoname, empty);     
  }

  manifesto =  loadStrings(manifestoname);    
  println(manifesto[1]);



   
}

void draw() {
  background(64, 129, 64, 7);

  world.step();
  world.draw(this);
}

void keyPressed() {
  if (key == ENTER) {
    msg = manifesto[linenum];
    if (!msg.equals("")) {
      Texto t = new Texto(msg);
      t.setPosition(width/2, height);
      t.setRotation(random(-1, 1));
      t.setFill(255);
      t.setNoStroke();
      t.setRestitution(0.65);
      world.add(t);
      linenum = (linenum+1)%manifesto.length;
    }
  } 
  if (key == 'c') {
    world.clear();
    
  world.setEdges(this, color(120));
  world.remove(world.bottom);
    }

}



