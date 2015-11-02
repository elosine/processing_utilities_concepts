color ellipseColor = color(0, 0, 0);
void setup() {
  size(500, 500);
  thread("rainbow");
}             
void draw() {  
  background(0);
  fill( ellipseColor );
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 50, 50);
}      
void rainbow() {
  for (int i = 0; i < 100; i++) {
    ellipseColor = color(random(0,255), random(0,255), random(0,255));
    try {    
      Thread.sleep(100); // delay does not work here     
    }
    catch (Exception e) {
    };       
  }            
}
