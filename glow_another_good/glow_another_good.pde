color c = color(255, 124, 0);
color g = color(0, 122, 0);
float rMin = 10;
float rMax = 50;
float r = rMin;
boolean grow = true;
int glowWidth = 20;
int glowIntensity = 3;
float rw = 100;
float rh = 7;
float gradient = 1.1;

void setup()
{
  size(200,200);
  frameRate(30);
  ellipseMode(RADIUS);
  smooth();
  r = rMin;
}
void draw()
{
 background(0);
 
 /*
 //ELLIPSE
 stroke(c);
 fill(c);
 ellipse(height/2, width/2, r, r);
 noFill();
 for (int i = 1; i < glowWidth; i++)
 {
   stroke(red(c), green(c), blue(c), 255/i);
   strokeWeight(glowIntensity);
   ellipse(height/2, width/2, r+i, r+i);
 }
 */
 
 
 //RECT
 rectMode(CENTER);
 stroke(c);
 fill(c);
 rect(height/2, width/2, rw, rh);
 
 
 //glow
 noFill();
 for (int i = 1; i < glowWidth; i++){
   float alpha = 255/(i*gradient);
   stroke(red(g), green(g), blue(g), alpha);
   strokeWeight(glowIntensity);
   rect(height/2, width/2, rw+i, rh+i, 20, 20, 20, 20);
 }
 
 
 
 
 //GROW & SHRINK
 /*
 if ( grow ) 
 {
   r += 8/frameRate;
   if ( r > rMax ) grow = false;
 }
 else
 {
   r -= 8/frameRate;
   if ( r < rMin ) grow = true;
 } 
 */
 
 //
}
