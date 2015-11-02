import fisica.*;

FWorld world;
//FWorld mundo;


void setup(){
  size(500, 500);
  Fisica.init(this);
  
  world = new FWorld();
  world.setGravity(0, 0);
  
}

void draw(){
  background(0);
  
  if(keyPressed){
    
    if(key=='a'){
      FCircle b = new FCircle(8);
      b.setNoStroke();
      b.setFill(255, 0, 0);
      //set position of ball to tip of space ship
      b.setPosition(width/2, height-50);
      b.setVelocity(0, -400);
      world.add(b);
      
    }
  }
  
  world.step();
  world.draw(this);
  
}
