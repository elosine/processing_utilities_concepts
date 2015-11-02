/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/7294*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* 
 * Satish Goda, Jan 30 2010. satishgoda at gmail dot com 
 * USAGE: 
 *   Middle mouse click to create points.  
 *   Paint direction Vector using "left mouse click", drag and let go. 
 *   Point moves along the direction vector.
 **/

ArrayList points;

PVector mouseClickStart; 
PVector mouseClickEnd; 
boolean mouseDragging = false; 

void setup() 
{ 
  size(720, 546); 
  background(0); 
  smooth(); 

  points = new ArrayList();

  mouseClickStart = new PVector(0.0, 0.0); 
  mouseClickEnd = new PVector(0.0, 0.0);
} 

void draw() 
{ 
  fill(0, 30); 
  noStroke(); 
  rect(0, 0, width, height); 

  if(mouseDragging == true) { 
    stroke(127); 
    line(mouseClickStart.x, mouseClickStart.y, mouseClickEnd.x, mouseClickEnd.y); 
  } 

  for(int i=points.size()-1; i >= 0; i--) {
    Point thePoint = (Point) points.get(i);
    thePoint.draw();
  }
} 

void mousePressed() 
{ 
  if(mouseButton == LEFT) { 
    mouseClickStart.set(mouseX, mouseY, 0); 
  } 
} 

void mouseDragged() 
{ 
  if(mouseButton == LEFT) { 
    mouseDragging = true; 
    mouseClickEnd.set(mouseX, mouseY, 0); 
  } 
} 

void mouseReleased() 
{ 
  if(mouseButton == LEFT) { 
    mouseClickEnd.set(mouseX, mouseY, 0); 

    for(int i=points.size()-1; i >= 0; i--) {
      Point thePoint = (Point) points.get(i);
      thePoint.setDirection(mouseClickStart, mouseClickEnd);
    }

    mouseClickStart.set(0, 0, 0); 
    mouseClickEnd.set(0, 0, 0); 
    mouseDragging = false; 
  }   
} 

void mouseClicked() 
{ 
  if(mouseButton == CENTER) {
    for(int i=points.size()-1; i >= 0; i--) {
      ((Point) points.get(i)).toggleActive(false);
    }
    
    points.add(new Point(mouseX, mouseY, 25, 30));
  }
} 











