PGraphics g;
int x;
 
void setup()
{
  size( 720, 480, P2D);
  // create the mask
  g = createGraphics(width,height, P2D);
}  
 
void draw()
{
  background(244,90,10);
  
  noStroke();
  fill(0, 255, 0);
  rect(width/2, 100, 50, 50);
  // draw the mask
  g.beginDraw();
  g.background(50);
  g.stroke(255);
  g.line(0, x%height, g.width, x++%height);
  g.ellipse(width/2, x%height, 100, 100);
  g.endDraw();
 
 
  // apply the mask to the screen
  blend(g, 0, 0, width, height, 0, 0, width, height, MULTIPLY);
 
 
  ellipse(width/2+50, x%height, 100, 100);

 
 
}
