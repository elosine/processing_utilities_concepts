import java.awt.*;

TextArea ta = new TextArea(10, 36);

void setup() {
  size(1000, 1000);
  
  ta.setFont(new Font("Monaco", Font.PLAIN, 14));

  ta.setLocation(100, 100);

  add(ta);
 // textField.setRows(5);
}

void draw () {
  background(255); 
  
  println(ta.getText());
}

private final static String newline = "\n";

