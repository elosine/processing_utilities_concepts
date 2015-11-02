


PFont font;
int t = 100;
int b = 115;
int l = 100;
int r = 200;
int m, c, w, h;
 
void setup() {
  size(500, 500);
  font = loadFont("Monaco-14.vlw");
  textFont(font);
  textSize(14);
  
 w = r-l;
 m = l + round(w/2.0);
 h = b-t;
 c = t + round(h/2.0);
  
}
 
void draw() {
  background(255);
  
  rectMode(CORNER);
  noFill();
  stroke(255, 0, 0);
  strokeWeight(8);
  rect(l, t, w, h);
 
  rectMode(CORNER);
  textAlign(LEFT, CENTER);
    fill(0);    
    text("hellothereyoungpadwanskiemperorrulesdarthvadersuckseggs", /*x1*/ l, /*y1*/ t, /*x2*/ w, /*y2*/ h);
}
