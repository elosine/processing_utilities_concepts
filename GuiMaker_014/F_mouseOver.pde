boolean mouseOver(PApplet p, float l, float t, float r, float b){
  boolean mouseIsOver = false;
 if(p.mouseX>=l && p.mouseY>=t && p.mouseX<=r && p.mouseY<=b) {mouseIsOver = true;}
 return mouseIsOver;
}
