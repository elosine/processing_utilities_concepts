/*

 GL Text Example - Renedering Lots of Text in Processing, Fast.
 blprnt@blprnt.com
 November, 2010
 
 //*/

//IMPORTANT - You need to have this library installed - http://glgraphics.sourceforge.net/
import codeanticode.glgraphics.*;
import processing.opengl.*;

//ArrayList holding our TextObjects
ArrayList<TextObject> textObjects = new ArrayList();
//The array of text we're rendering
String[] lyrics;
//A counter to let us know where we are in the text
int lyricCount = 0;

//The display font
PFont label;

//This is the off-screen graphics object that the text gets rendered to.
//We could render it to the main screen, but it would get messy.
PGraphics offScreen;

//We make a reference to the main PApplet (this is used to create the GLTextures)
PApplet app = this;

void setup() {
  //We use the GLGraphics renderer instead of the classic OPENGL renderer.
  size(1280, 720, GLConstants.GLGRAPHICS);
  //Here we make the off-screen buffer. Might have to be larger for bigger text blocks.
  offScreen = createGraphics(500, 200, P2D);
  //Build the font object
  label = createFont("Helvetica", 24);  
  //Load the sample text
  lyrics = loadStrings("myriad.txt");
};

void draw() {
  //Every frame, we render each TextObject
  background(30);
  for (TextObject t : textObjects) {
    t.render();
  };

  //Framerate and object count
  textFont(label);
  textSize(24);
  fill(255, 100);
  text(round(frameRate), 20, 20);
  text(textObjects.size(), 20, 40);

  //Add a TextObject when the mouse is pressed
  if (mousePressed) {
    TextObject t = addRandomText();
    t.pos.x = mouseX;
    t.pos.y = mouseY;
  };
};

TextObject addRandomText() {
  TextObject newText = new TextObject(lyrics[lyricCount++ % lyrics.length]);
  textObjects.add(newText); 
  return(newText);
};

void keyPressed() {
  save("out" + hour() + "_" + minute() + "_" + second() + ".png");
};


