import java.awt.event.KeyEvent;
 
int largeChangeX;
int smallChangeX;
int largeChangeY;
int smallChangeY;
int xPos;
int yPos;
//
// keep a map of the pressed keys for detecting shifted combinations
//
boolean[] keys = new boolean[526];
 
void setup()
{
  size(500,400);
  largeChangeX = width/20;
  smallChangeX = largeChangeX/5;
  largeChangeY = height/10;
  smallChangeY = largeChangeY/5;
  xPos = (int)random(width);
  yPos = (int)random(height);
}
void draw()
{
  background(123);
  fill(24, 123, 234);
  ellipse(xPos, yPos, 200, 100);
  noLoop();
}
 
void adjustPosition(int xOffset, int yOffset)
{
  xPos += xOffset;
  yPos += yOffset;
  loop();
}
void keyPressed() 
{
  keys[keyCode] = true;
  whatKey(key, keyCode);
}
void keyReleased()
{ 
  keys[keyCode] = false;
}
 
//
// simple approach to dealing with shifted keys
//
boolean isKeyPressed(int k)
{
  if (keys.length >= k) 
  {
    return keys[k];
  }
  return false;
}
//
// compose key description prefix of shifted keys
//
String keyPrefix()
{
  String prefix;
  boolean prefixPresent;
  prefix = "";
  prefixPresent = false;
 
  if (isKeyPressed(KeyEvent.VK_SHIFT))
  {
    prefix += "SHIFT";
    prefixPresent = true;
  }
  if (isKeyPressed(KeyEvent.VK_CONTROL))
  {
    prefix += (prefixPresent == true ? "-" : "") +"CTRL";
    prefixPresent = true;
  }
  if (isKeyPressed(KeyEvent.VK_ALT))
  {
    prefix += (prefixPresent == true ? "-" : "") +"ALT"; 
    prefixPresent = true;
  }
  prefix += (prefixPresent == true ? " " : "");
  return prefix;
}
//
//
//
void whatKey(int key, int keycode)
{
  int adjustmentX;
  int adjustmentY;
  String what;
  adjustmentX = adjustmentY = 0;
  //
  // show what key has struct
  //
  what = keyPrefix() + KeyEvent.getKeyText(keyCode);
     println("Key is ==>"+what+"<==");
 
  switch(keycode)
  {
  case KeyEvent.VK_PAGE_UP:      
    adjustmentY = -largeChangeY;
    break;
  case KeyEvent.VK_PAGE_DOWN:      
    adjustmentY = largeChangeY;
    break;
  case KeyEvent.VK_END:
    adjustmentX = width - xPos;      
    break;
  case KeyEvent.VK_HOME:
    adjustmentX = -xPos;
    break;
  case KeyEvent.VK_LEFT:
     if (isKeyPressed(KeyEvent.VK_SHIFT))
    {
       adjustmentX = -largeChangeX;
    }
    else
    {
     adjustmentX = -smallChangeX;     
    }
    break;
  case KeyEvent.VK_UP:
    if (isKeyPressed(KeyEvent.VK_SHIFT))
    {
       adjustmentY = -largeChangeX;
    }
    else
    {
     adjustmentY = -smallChangeX;     
    }
    break;
  case KeyEvent.VK_RIGHT:
    if (isKeyPressed(KeyEvent.VK_SHIFT))
    {
       adjustmentX = largeChangeX;
    }
    else
    {
     adjustmentX = smallChangeX;     
    }
    break;
  case KeyEvent.VK_DOWN:
    if (isKeyPressed(KeyEvent.VK_SHIFT))
    {
       adjustmentY = largeChangeX;
    }
    else
    {
     adjustmentY = smallChangeX;     
    }
    break;
  case KeyEvent.VK_NUMPAD1:
    adjustmentX = width -xPos;
    break;
  case KeyEvent.VK_NUMPAD2:
    adjustmentY = +smallChangeY;
    break;
  case KeyEvent.VK_NUMPAD3:
    adjustmentY = +largeChangeY;
    break;
  case KeyEvent.VK_NUMPAD4:
    adjustmentX = -smallChangeX;
    break;
  case KeyEvent.VK_NUMPAD5:
    break;
  case KeyEvent.VK_NUMPAD6:
    adjustmentX = smallChangeX;
    break;
  case KeyEvent.VK_NUMPAD7:
    adjustmentX = -xPos;
    break;
  case KeyEvent.VK_NUMPAD8:
    adjustmentY = -smallChangeY;
    break;
  case KeyEvent.VK_NUMPAD9:
    adjustmentY = +largeChangeY;
    break;
  case KeyEvent.VK_TAB:
    if (isKeyPressed(KeyEvent.VK_SHIFT))
    {
      adjustmentX = width-xPos;
      adjustmentY = height+yPos;
    } 
    else
    {
      adjustmentX = -xPos;
      adjustmentY = -yPos;
    }
    break;
  }
  adjustPosition(adjustmentX, adjustmentY);
}
