import java.util.*;
C3 c3;
C2 c2;
List<C2> al = new ArrayList<C2>();

void setup(){
  c2 = new C2();
  
  c3 = new C3(al);
}
void draw(){}

class C1{}
class C2{}
class C3{
  C3(List<?> a){
   // a.add(new C2());
    a.add(c2);
    println(a);
  }
  

}

