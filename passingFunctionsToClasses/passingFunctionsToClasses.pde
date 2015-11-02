interface buttonAction{
  void doStuff();
}

class test implements buttonAction{
  void doStuff(){
    println("We're test!");
  }
}

class test2 implements buttonAction{
  void doStuff(){
    println("We're test2!");
  }
}

class button{
  buttonAction action;
  button(buttonAction _action){
    // ... normal stuff...
    action=_action;
  }

  void clicked(){
    //.. anything else you do when clicked
    action.doStuff();
  }
}

button buttonA,buttonB;
test testA;
test2 testB;

void setup(){
  //...
  testA=new test();
  testB=new test2();
  buttonA=new button(testA);
  buttonB=new button(testB);
}

void draw(){
  //...
} 
void mousePressed(){
 // buttonA.clicked();
  buttonB.clicked();
}
