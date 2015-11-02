float radius = 30;
float cx = 50;
float cy = 50;

float x=28;
float y=70;




float l = 0;

void setup(){
  size(300, 300);
  
}

void draw(){
  background(0);
  noStroke();
  
  
  fill(0,255,0);
  ellipse(cx, cy, radius*2, radius*2);
  
  fill(255);
  ellipse(x, y, 2, 2);

l = dist(x, y, cx, cy);

if(l>radius){
  println("no way jose");
}
else{
  println("yea baby");
}

}
