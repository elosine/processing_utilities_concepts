Handle[] handles;

void setup() {
  size(640, 360);
  int num = height/15;
  handles = new Handle[num];
  int hsize = 10;
  for (int i = 0; i < handles.length; i++) {
    handles[i] = new Handle(width/2, 10+i*15, 50-hsize/2, 10, handles);
  }
}

void draw() {
  background(153);
  
  for (int i = 0; i < handles.length; i++) {
    handles[i].update();
    handles[i].display();
  }
  
  fill(0);
  rect(0, 0, width/2, height);
}

void mouseReleased()  {
  for (int i = 0; i < handles.length; i++) {
    handles[i].releaseEvent();
  }
}



boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

int lock(int val, int minv, int maxv) { 
  return  min(max(val, minv), maxv); 
} 