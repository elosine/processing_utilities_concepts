import java.util.Random;
import java.util.Arrays;
 
 
color[] colors = new color[16];
int k;
 
void setup() {
  colorMode(HSB, 16, 100, 100);
  size(800, 950);
  background(0, 0, 100);
 
  for (k=0; k<16; k++) {
    colors[k] = color(k+1, 75, 100);
  }
 
  shuffleArray(colors);
  noLoop();
}  
 
 
void draw() {
  background(0, 0, 100);
  int k= 0;
  for (float i = 150; i < 701; i = i+166) {
    for (float j = 150; j < 701; j = j+166) {
      noStroke();
      fill(colors[k]);
      ellipse(i, j, 100, 100);
      k++;
    }
  }
}
 
 
 
// click to re-shuffle...
void mousePressed() {
 
  shuffleArray(colors);
  redraw();
}
 
// any key to re-sort...
void keyReleased() {
 
  Arrays.sort(colors);
  redraw();
}
 
 
 
 
void shuffleArray(int[] array) {
 
  // with code from WikiPedia; Fisher–Yates shuffle 
  //@ <a href="http://en.wikipedia.org/wiki/Fisher" target="_blank" rel="nofollow">http://en.wikipedia.org/wiki/Fisher</a>–Yates_shuffle
 
  Random rng = new Random();
 
  // i is the number of items remaining to be shuffled.
  for (int i = array.length; i > 1; i--) {
 
    // Pick a random element to swap with the i-th element.
    int j = rng.nextInt(i);  // 0 <= j <= i-1 (0-based array)
 
    // Swap array elements.
    int tmp = array[j];
    array[j] = array[i-1];
    array[i-1] = tmp;
  }
}