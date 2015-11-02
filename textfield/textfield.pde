import java.awt.*;
TextField textField = new TextField("Text", 16);

void setup() {
  size(1000, 1000);
  add(textField);
}

void draw () {
  background(255);
  textField.setLocation(25, 655); 
  
  println(textField.getText());
}
