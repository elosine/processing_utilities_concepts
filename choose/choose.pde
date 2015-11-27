void setup(){

println(chooseInt(new int[]{11,2222,35,4432423}));

}
int chooseInt(int[]set){
  int v = set[floor(random(set.length))];
  return v;
}

void draw(){
  
}