String you = "";
PFont f1;
void setup() {
  size(500, 500);
  f1 = loadFont("Monaco-48.vlw");
  textFont(f1);
}
void draw() {
  background(0);
  fill(153,255,20);
  text(you, 20, 100);
}

void keyPressed() {

  if (keyCode == 32) {
    String[] newlist = new String[0];
    String[] students = loadStrings("list.txt");
    if (students.length != 0) {
      int choice = floor(random(0, students.length));
      you = students[choice];
      for (int i=0; i<students.length; i++) {
        if (i!=choice) {
          newlist = append(newlist, students[i]);
        }
      }
      String[] studentsused = loadStrings("listused.txt");
      studentsused = append(studentsused, students[choice]);
      saveStrings("listused.txt", studentsused );
      saveStrings("list.txt", newlist);
    } 
    else {
      String[] studentsN = loadStrings("listused.txt");
      int choice = floor(random(0, studentsN.length));
      you = students[choice];
      for (int i=0; i<studentsN.length; i++) {
        if (i!=choice) {
          newlist = append(newlist, studentsN[i]);
        }
      }
      String[] studentsused = new String[0];
      studentsused = append(studentsused, studentsN[choice]);
      saveStrings("listused.txt", studentsused );
      saveStrings("list.txt", newlist);
    }
  }
}