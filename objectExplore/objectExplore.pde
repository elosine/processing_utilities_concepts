/**
 * oscP5oscArgument by andreas schlegel
 * example shows how to parse incoming osc messages "by hand".
 * it is recommended to take a look at oscP5plug for an alternative way to parse messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;

import java.util.Arrays;

OscP5 oscP5;
NetAddress myRemoteLocation;
Object[] obj;
String s = "/test,int:1,float:3.314,str:mo money mo money";
String oaddr;

void setup() {
  size(400, 400);
  frameRate(25);
  String[] st = split(s, ',');
  oaddr = st[0];

  obj = new Object[0] ;
  for(int i=1;i<st.length;i++){
    String[] stt = split(st[i], ':');
    if(stt[0].equals("int") )obj = appendValue(obj, int(stt[1]) );
    if(stt[0].equals("float") )obj = appendValue(obj, float(stt[1]) );
    if(stt[0].equals("str") )obj = appendValue(obj, stt[1] );
  }
  println(obj);



  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
  /* send an OSC message to this sketch */
  oscP5.send(oaddr, obj, myRemoteLocation);
}

void draw() {
  background(0);
}

private Object[] appendValue(Object[] obj, Object newObj) {

  ArrayList<Object> temp = new ArrayList<Object>(Arrays.asList(obj));
  temp.add(newObj);
  return temp.toArray();
}

void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */
  if (theOscMessage.checkAddrPattern("/test")==true) {
    /* check if the typetag is the right one. */
    if (theOscMessage.checkTypetag("ifs")) {
      /* parse theOscMessage and extract the values from the osc message arguments. */
      int firstValue = theOscMessage.get(0).intValue();  // get the first osc argument
      float secondValue = theOscMessage.get(1).floatValue(); // get the second osc argument
      String thirdValue = theOscMessage.get(2).stringValue(); // get the third osc argument
      print("### received an osc message /test with typetag ifs.");
      println(" values: "+firstValue+", "+secondValue+", "+thirdValue);
      return;
    }
  }
  println("### received an osc message. with address pattern "+
    theOscMessage.addrPattern()+" typetag "+ theOscMessage.typetag());
}

