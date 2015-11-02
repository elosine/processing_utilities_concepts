PGraphics buffer, b2;
PImage img, i2;

void setup() {
  size(500, 500);

  // Create an off-screen buffer.
  buffer = createGraphics(500, 500, JAVA2D);
  b2 = createGraphics(500, 500, JAVA2D);

  // Draw something complex in the off-screen buffer.
  renderImg(buffer);
  img = buffer.get(0, 0, buffer.width, buffer.height);

}

void draw() {
  background(255);


  //Add Buffer to Another Buffer
  b2.beginDraw();
  b2.image(img, 0, 0);
  b2.endDraw();

  i2 = b2.get(0, 0, b2.width, b2.height);
  image(i2, 0, 0);


  // We can still animate things on the main canvas.
  noStroke();
  fill(255, 0, 0, 128);
  ellipse(random(width), random(height), 20, 20);
}

/**
 * Draws a complex drawing into an off-screen buffer.
 */
void renderImg(PGraphics buffer) {
  buffer.beginDraw();
  buffer.background(255);
  buffer.smooth();
  buffer.noFill();

  for (int i = 0; i < buffer.width; i++) {
    for (int j = 0; j < buffer.height; j++) {
      if (i % 8 == 0 && j % 8 == 0) {
        buffer.stroke(random(30) + 80, random(30) + 40, 0, random(60) + 24);
        float x = width / 2 + (random(60) - 30);
        float y = 0;
        float x2 = x + (random(160) - 80);
        float y2 = random(height / 2) + height / 2;

        buffer.bezier(x, y, 
          x + (random(x/2) - x/2), y + (random(y/2) - y/2), 
          x2 + (random(x2/2) - x2/2), y2 + (random(y2/2) - y2/2), 
          x2, y2);
      }
    }
  }

  buffer.endDraw();
}