ArrayList<Testclass> tc = new ArrayList<Testclass>();
void setup(){ 
 tc.add( new Testclass() ); 
 tc.add( new Testclass() ); 

for (Testclass inst:tc) { //Class name; local/temp instance variable name; ArrayList name
    inst.p();
  }
}
void draw(){
}
class Testclass{
  void p(){
    println("class instance");
  }
}


