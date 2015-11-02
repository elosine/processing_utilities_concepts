MidiThread midi;

void setup() {
  size(100, 100);
  // create new thread running at 160bpm, bit of D'n'B
  midi=new MidiThread(160);
  midi.start();
}

void draw() {
  // do whatever
}

// also shutdown the midi thread when the applet is stopped
public void stop() {
  if (midi!=null) midi.isActive=false;
  super.stop();
}

class MidiThread extends Thread {

  long previousTime;
  boolean isActive=true;
  double interval;

  MidiThread(double bpm) {
    // interval currently hard coded to quarter beats
    interval = 1000.0 / (bpm / 60.0); 
    previousTime=System.nanoTime();
  }

  void run() {
    try {
      while (isActive) {
        // calculate time difference since last beat & wait if necessary
        double timePassed=(System.nanoTime()-previousTime)*1.0e-6;
        while (timePassed<interval) {
          timePassed=(System.nanoTime()-previousTime)*1.0e-6;
        }
        // insert your midi event sending code here
        println("midi out: "+timePassed+"ms");
        // calculate real time until next beat
        long delay=(long)(interval-(System.nanoTime()-previousTime)*1.0e-6);
        previousTime=System.nanoTime();
        Thread.sleep(delay);
      }
    } 
    catch(InterruptedException e) {
      println("force quit...");
    }
  }
} 



   
thread()
Examples  

String time = "";

void setup() {
  size(100, 100);
}

void draw() {
  background(0);
  // Every 30 frames request new data
  if (frameCount % 30 == 0) {
    thread("requestData");
  }
  text(time, 10, 50);
}

// This happens as a separate thread and can take as long as it wants
void requestData() {
  JSONObject json = loadJSONObject("http://time.jsontest.com/");
  time = json.getString("time");
}



class BasicThread2 implements Runnable {
    // This method is called when the thread runs
    public void run() {
    }
}

// Create the object with the run() method
Runnable runnable = new BasicThread2();
    
// Create the thread supplying it with the runnable object
Thread thread = new Thread(runnable);
    
// Start the thread
thread.start();

