
//--processing code:
 import oscP5.*;
 import netP5.*;
 OscP5 oscP5;
 
 final int BUFFERSIZE= 2048;  //should correspond with fft size in supercollider
 final int BUFFERSIZE2= BUFFERSIZE/2; 
 
 float[] fftArray;
 
 void setup() {
 //size(1024, 768, P2D);  //P2D or P3D
 size(1280, 768, P2D);  //P2D or P3D
 frameRate(60);
 background(0);
 noSmooth();
 
 fftArray= new float[BUFFERSIZE2];
 for (int i= 0; i<BUFFERSIZE2; i++) {
 fftArray[i]= 0.0;
 }
 
 //--network
 OscProperties properties= new OscProperties();
 //properties.setRemoteAddress("127.0.0.1", 57120);  //osc send port (to sc)
 properties.setListeningPort(47120);               //osc receive port (from sc)
 //properties.setSRSP(OscProperties.ON);  //unused
 //properties.setDatagramSize(min(BUFFERSIZE*4, 8192));
 properties.setDatagramSize(5136);  //5136 is the minimum 
 oscP5= new OscP5(this, properties);
 }
 
 void oscEvent(OscMessage msg) {
 if (msg.checkAddrPattern("/fftArray")) {
 for (int i= 0; i<BUFFERSIZE2; i++) {
 fftArray[i]= msg.get(i).floatValue();
 }
 }
 }
 
 void draw() {
 background(0);
 noFill();
 for(int x= 0; x<BUFFERSIZE2; x++) {
 stroke(fftArray[x]*255.0, 0, 0);
 line(x, height*0.1, x, height*0.9);
 }
 }
 
/*
//--supercollider code:
(
var buffersize= 2048;
var buffersize2= buffersize.div(2);
n= NetAddr("127.0.0.1", 47120);
s.waitForBoot {
  c= Bus.control(s, buffersize2);
  b= Buffer.alloc(s, buffersize, 1);
  SynthDef(\avTrk, {
    |in= 0, t_trig= 0, amp= 1, bus|
      var z= Mix(In.ar(in, 2)*amp);
    var chain= FFT(b, z);
    Array.fill(buffersize2, {
      |i|
        var a= Unpack1FFT(chain, buffersize, i);
      var d= Demand.kr(chain>=0, 0, a);
      Out.kr(bus+i, d.min(1));
    }
    );
  }
  ).load;
  s.sync;
  ~trk= Synth(\avTrk, [\in, 0, \amp, 0.3, \bus, c]);
  a= play {
    var a=SinOsc;
    Splay.ar(a.ar(PulseCount.ar(f=InFeedback.ar(0, 2).sum)%999+(60, 63.0005..99)*a.ar(2**f)*2+[3, 4], f>0*f*9)).tanh*MouseX.kr(0, 1)
  };

  Routine.run( {
    inf.do {
      var fftArray= c.getnSynchronous(buffersize2);
      n.sendMsg(\fftArray, *fftArray);  //sending 1024 values
      (1/61).wait;  //a tiny bit faster than framerate
    };
  }
  );
  CmdPeriod.doOnce( {
    b.free; 
    c.free
  }
  );
};
)

*/
