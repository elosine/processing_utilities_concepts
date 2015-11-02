import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

//Variables
ControlIO control;
Configuration config;
ControlDevice gpad, gpad2;

float x = 10;
float y = 100;

float xspd = 43.0;
float yspd = 43.0;

float padx, pady;

boolean lpressed = false;
float b;


public void setup() {
  size(700, 700);
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

public void draw() {
  background(50, 200, 75, 1);
  lpressed = gpad.getButton("l").pressed();
  b = gpad.getButton("l").getValue();
  // println(b);
  padx = gpad2.getSlider("x").getValue();
  pady = gpad.getSlider("y").getValue();
  // println(padx);

  x = x + padx * xspd;
  y = y + pady * yspd;
  noStroke();

  if (lpressed) {
    fill(255, 128, 0);
  } else {
    fill(255, 0, 255);
  }
  ellipse(x, y, 50, 50);

  // println(lpressed);
}


void lreleased() {
  println("let it go");
}

