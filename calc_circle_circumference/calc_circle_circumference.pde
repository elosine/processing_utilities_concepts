float radius = 10;
float cx = 50;
float cy = 50;

float x=0;
float y=0;




float l = 0;

void setup(){
  size(300, 300);
  
}

l = dist(x, y, cx, cy);

if(l>radius){
  println("no way jose");
}
