/*

TextObject
blprnt@blprnt.com
November, 2010

//*/

public class TextObject {
  
  String textString = "test";              //This is the text that is displayed for this object
  PVector pos = new PVector(0,0);          //x,y position
  float r = 0;                             //Rotation
  
  GLTexture blitImage;                    //This is the GLTexture that gets rendered. GLTextures are subclasses of PImage, so can be used in the same way.
  
  TextObject(String t) {
    textString = t;
    r = random(PI * 2);
    makeImage();
  };
  
  void makeImage() {
      //Here, we draw the text to the offscreen graphics object.
      offScreen.beginDraw();
      offScreen.background(0);
      offScreen.textFont(label);
      offScreen.textSize(14);
      offScreen.fill(0);
      offScreen.noStroke();
      
      offScreen.fill(255);
      offScreen.text(textString, 4, 14);
      offScreen.endDraw();
      
      //When we're done drawing, we grab pixels from the offscreen GO and store it temporarily in a PImage.
      PImage temp = offScreen.get(0,0,round(offScreen.textWidth(textString)) + 8,18);
      //Finally, we create a GLtexture, and put the image data inside of it
      blitImage = new GLTexture(app);
      blitImage.putImage(temp);
      
     

  };
  
  void render() {
    //Rendering the text objects involves just drawing the GLTexture using our usual image() method.
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(r);
      image(blitImage,0,0);
    popMatrix();
    r += 0.01;
  };
  
};
