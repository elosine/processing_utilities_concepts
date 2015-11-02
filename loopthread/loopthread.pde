
    class MyThread extends Thread {
      boolean active;
     
      CalsignThread() {
        active = false;
      }
     
      void start() {
        active = true;
        super.start();
      }
     
      void run () {
        while (true) {
          if(active) {
            execute();
          } else {
            break;
          }
        }
      }
     
      void execute() {
       
      }
     
      boolean isActive() {
          return active;
      }
     
      void quit() {
        active = false;
        interrupt();
      }
    }

