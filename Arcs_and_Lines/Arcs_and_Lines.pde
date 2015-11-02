//look up chalk, chalkboard texture
//make catalog of shapes 1-20
//not-straight function

int lnwt = 3;
CrookedLine [] cls;
int cellsz = 65;


void setup() {
  size(650, 650);
  smooth();
  cls = new CrookedLine[7];
  for (int i=0; i<cls.length; i++) {
    cls[i] = new CrookedLine(width/2, height/2, 0, 0, 0, cellsz, ceil(random(4)), 30);
  }
}

void draw() {
  background(0);
  arcsAndLines(width/2, height/2, cellsz, 1, 13, 1);

  cls[0].drw();
}

void arcsAndLines(int x, int y, int sz, int bb, int s1, int s2) {
  noFill();

  //Bounding box
  if (bb==1) {
    stroke(255, 165, 0);
    strokeWeight(1);
    rectMode(CORNER);
    rect(x, y, sz, sz);
    ellipse(x+(sz/2), y, 3, 3);
    ellipse(x+(sz/2), y+sz, 3, 3);
    ellipse(x, y+(sz/2), 3, 3);
    ellipse(x+sz, y+(sz/2), 3, 3);
  }

  //Shape 1
  switch(s1) {

  case 1:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x, y+sz, sz*2, sz*2, -HALF_PI, 0);
    break;

  case 2:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x, y, sz*2, sz*2, 0, HALF_PI);
    break;

  case 3:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x+sz, y, sz*2, sz*2, HALF_PI, PI);
    break;

  case 4:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x+sz, y+sz, sz*2, sz*2, -PI, -HALF_PI);
    break;

  case 5:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x-(sz/2.66667), y+(sz/2), sz*2, sz*2, -0.16667*PI, 0.16667*PI);
    break;

  case 6:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x+(sz/2), y-(sz/2.66667), sz*2, sz*2, HALF_PI - (0.16667*PI), HALF_PI + (0.16667*PI) );
    break;

  case 7:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc( x+sz+(sz/2.66667), y+(sz/2), sz*2, sz*2, PI - (0.16667*PI), PI + (0.16667*PI) );
    break;

  case 8:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc( x+(sz/2), y+sz+(sz/2.66667), sz*2, sz*2, -HALF_PI - (0.16667*PI), -HALF_PI + (0.16667*PI) );
    break;

  case 9:
    stroke(255);
    strokeWeight(lnwt);
    line( x+(sz/2), y, x+(sz/2), y+sz );
    break;

  case 10:
    stroke(255);
    strokeWeight(lnwt);
    line( x, y+(sz/2), x+sz, y+(sz/2) );
    break;

  case 11:
    stroke(255);
    strokeWeight(lnwt);
    line( x+sz, y, x, y+sz );
    break;

  case 12:
    stroke(255);
    strokeWeight(lnwt);
    line( x, y, x+sz, y+sz );
    break;
  }

  //Shape 2
  switch(s2) {

  case 1:
    stroke(255);
    strokeWeight(4);
    ellipseMode(CENTER);
    arc(x, y+sz, sz*2, sz*2, -HALF_PI, 0);
    break;

  case 2:
    stroke(255);
    strokeWeight(4);
    ellipseMode(CENTER);
    arc(x, y, sz*2, sz*2, 0, HALF_PI);
    break;
  }
}


//COMMENT THIS


class CrookedLine {
  int locx, locy, x1, y1, x2, y2, numpts;
  float w;
  PVector start, dir, end, pp1;
  PVector[] pts;
  float[] segs;


  CrookedLine(int alocx, int alocy, int ax1, int ay1, int ax2, int ay2, int anumpts, float aw) {
    locx = alocx;
    locy = alocy;
    x1 = ax1;
    y1 = ay1;
    x2 = ax2;
    y2 = ay2;
    numpts = anumpts;
    w = aw;

    start = new PVector(x1, y1);
    dir = new PVector(x2, y2);
    end = PVector.add(start, dir);
    pts= new PVector[numpts];

    pp1 = new PVector(dir.y, -dir.x);
    pp1.normalize();
    pp1.mult(w/2.0);

    segs = new float[numpts];
    for (int i=0; i<segs.length; i++) {
      segs[i] = random(1.0);
    }
    segs = sort(segs);

    for (int i=0; i<numpts; i++) {
      pts[i] = PVector.add( start, PVector.mult( dir, segs[i] ));
      pts[i] = PVector.add( pts[i], PVector.mult( pp1, random(-1.0, 1.0) ) );
    }
  }

  void drw() {
    noFill();
    stroke(255, 0, 0);
    pushMatrix();
    translate(locx, locy);

    beginShape();
    vertex(start.x, start.y);
    for (int i=0; i<pts.length; i++) {
      vertex(pts[i].x, pts[i].y);
    }
    vertex(end.x, end.y);
    endShape();

    popMatrix();
  }
}

