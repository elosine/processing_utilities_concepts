/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/9151*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* 
 Thomas Diewald
 25.04.2010
 experimenting with Gravity (just for fun)
 */

import peasy.*;
import oscP5.*;
import netP5.*;

PeasyCam cam; 
int sizeX, sizeY ;
int gridSizeX, gridSizeY;
Grid grid;
boolean RESET = false;
float indenture = 15.0;
OscP5 osc;

int vwtog = 0;


void setup() {
  osc = new OscP5(this, 12321);
  osc.plug(this, "fsr", "/fsr");
  indenture = 35.0;
  if (! RESET) {
    size(800, 600, P3D);
    indenture = 35.0;
    sizeX = width-100; 
    sizeY = height;
    gridSizeX = int((sizeX + sizeY)/2) ;
    gridSizeY = int((sizeX + sizeY)/2);

    //------------------------------------------------------------------------------------------
    // initialize camera ---> needed library: import peasy.*;
    cam = new PeasyCam(this, sizeX/2, sizeY/2, -150, 721.48);  // default settings on double click

    cam.setMinimumDistance(.001);
    cam.setMaximumDistance(50000);
    cam.setRotations( -0.02361463, 0.825124, -1.5524007);
  } // end if(! RESET)

  //------------------------------------------------------------------------------------------
  // initialize Grid
  int res = 7;
  int gridPointsX = gridSizeX / res;
  int gridPointsY = gridSizeY / res;
  grid = new Grid(gridPointsX, gridPointsY);
  float s = 1.5; // scale Grid
  for (int i = 0; i < gridPointsY; i++) {
    for (int j = 0; j < gridPointsX; j++) {
      int index = i*gridPointsX + j;
      float x = j * res * s + (sizeX - gridSizeX*s) / 2;
      float y = i * res * s + (sizeY - gridSizeY*s) / 2;
      float z = 0;
      grid.setGridPoint(index, x, y, z);
    } // end for j
  } // end for i

  frameRate(60);
} // end void setup

void draw() {
  background(0);
  noLights();
  println(cam.getRotations());
  println(cam.getDistance());

  // calculate the grid deformation
  grid.REsetGridPointPositionZ();
  grid.setGridPointPositionZ( width/2.0, height/2.0, indenture );  

  grid.drawGrid();                                                                 // draw grid
} // end void draw

void fsr(int ix, float val) {
  indenture = map(val, 0.0, 1.0, 4.0, 80.0);
}

void keyPressed() {
  if (key=='v') {
    vwtog = (vwtog+1)%2;
      switch(vwtog) {
    case 0:
      cam.setRotations( 1.45755, 0.88816, -3.11354);
      cam.setDistance(846.2288);
      break;
    case 1:
      cam.setRotations( -0.02361463, 0.825124, -1.5524007);
      cam.setDistance(721.48);
    }
  }
}


