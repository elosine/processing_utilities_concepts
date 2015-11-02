int[][]a = new int[4][];
int[]b = new int[4];

void setup(){
  for(int i=0;i<b.length;i++){
    b[i] = i;
  }
  for(int i=0;i<a.length;i++){
    a[i] = b;
  }
  println(a[3]);
  
}
