float cx, cy, freq, amp1, amp2, phase; 
float[] x, y;
float followerY = height/2;
float a, dx, dy, l, nx, ny, ntx, nty, tstep;
int numsteps;
float oscspeed = 0.3;

void setup() {  
  size(500, 500, P2D);  
  stroke(0);  
  cx=10; 
  cy=height/2; 
  freq=10; 
  amp1=2; 
  amp2=30; 
  phase=0;


   dx=400; 
   dy=0.1; 
   l=sqrt(dx*dx+dy*dy); 



  dx/=l; 
  dy/=l; 

  a=atan2(dy, dx)+HALF_PI; 
   nx=amp1*cos(a); 
   ny=amp1*sin(a); 

   ntx=(amp2-amp1)*cos(a); 
   nty=(amp2-amp1)*sin(a); 





   tstep = 1.0 / l; 
   numsteps = ceil(1.0/tstep);
  x = new float[numsteps]; 
  y = new float[numsteps];
}  



void draw() { 
  background(0);
  
  
    phase += oscspeed; 

  int inc = 0;

  for (float t=0; t<=1.0; t+=tstep) { 
    a = sin (phase + TWO_PI * t * freq); 
    x[inc] = cx + t * l * dx + nx * a + ntx * t * a; 
    y[inc] = cy+t*l*dy+ny*a+nty*t*a; 
    inc++;
  }



  beginShape(LINE_STRIP);  

  strokeWeight(4);
  stroke(255);
  for (int i=0; i<x.length; i++) { 

    vertex(x[i], y[i]);
  }  
  endShape();

  for (int i=0; i<x.length-1; i++) {
    if (mouseX>=x[i] && mouseX<x[i+1]) {
      followerY = map(mouseX, x[i], x[i+1], y[i], y[i+1]);
    }
  }
  noStroke();
  fill(255, 255, 50);
  ellipse(mouseX, followerY, 10, 10);
}  

