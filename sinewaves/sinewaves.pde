float cx, cy, freq, amp1, amp2, phase; 

void setup() {  
  size(500, 500, P2D);  
  stroke(0);  
  cx=width/2; 
  cy=height/2; 
  freq=5; 
  amp1=2; 
  amp2=30; 
  phase=0;
}  

void mousePressed() { 
  cx=mouseX; 
  cy=mouseY;
} 

void draw() { 
  background(0xffffff);


  float x, y, a; 
  float dx=mouseX-cx; 
  float dy=mouseY-cy; 
  float l=sqrt(dx*dx+dy*dy); 

 // phase+=0.1; 

  dx/=l; 
  dy/=l; 

  a=atan2(dy, dx)+HALF_PI; 
  float nx=amp1*cos(a); 
  float ny=amp1*sin(a); 

  float ntx=(amp2-amp1)*cos(a); 
  float nty=(amp2-amp1)*sin(a); 


  beginShape(LINE_STRIP);  
 
strokeWeight(4);
  float tstep=1.0 / l; 

  for (float t=0; t<=1.0; t+=tstep) { 
    a=sin(phase+TWO_PI*t*freq); 
    x=cx+t*l*dx+nx*a+ntx*t*a; 
    y=cy+t*l*dy+ny*a+nty*t*a; 
    vertex(x, y);
  }  
  endShape();
}  

