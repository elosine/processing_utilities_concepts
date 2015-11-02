import fisica.*;

import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

//Variables
ControlIO control;
Configuration config;
ControlDevice gpad, gpad2;

FWorld world;
//FWorld mundo;
boolean gate = true;
boolean lpressed;


void setup() {
  size(500, 500);
  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 0);

  // Initialise the ControlIO
  control = ControlIO.getInstance(this);
  // Find a device that matches the configuration file
  gpad = control.getMatchedDevice("snes");
  gpad2 = control.getMatchedDevice("snes");
  if (gpad == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW!
  }
  gpad.getButton("l").plug(this, "lreleased", ControlIO.ON_RELEASE);
}

void draw() {
  background(0);
  lpressed = gpad.getButton("l").pressed();

if(gate){

  if (lpressed) {
    gate = false;
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



void keyPressed() {

  if (gate) {
    if (key=='a') {
      gate = false;
      FCircle b = new FCircle(8);
      b.setNoStroke();
      b.setFill(255, 0, 0);
      //set position of ball to tip of space ship
      b.setPosition(width/2, height-50);
      b.setVelocity(0, -400);
      world.add(b);
    }
  }
}

void keyReleased() {
  if (key =='a') {
    gate = true;
  }
}



void lreleased() {

  gate = true;
}

