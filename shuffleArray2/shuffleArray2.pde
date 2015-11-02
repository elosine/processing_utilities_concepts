import java.util.Random;
import java.util.Arrays;


int[] a = {1, 2, 3, 4, 5};
void setup() {

  println(shuffleArray(a));
}  
void draw() {
}

int[] shuffleIntArray(int[] array) {
  int[]ats = array;
  // with code from WikiPedia; Fisher–Yates shuffle 
  //@ <a href="http://en.wikipedia.org/wiki/Fisher" target="_blank" rel="nofollow">http://en.wikipedia.org/wiki/Fisher</a>–Yates_shuffle
  Random rng = new Random();
  // i is the number of items remaining to be shuffled.
  for (int i = ats.length; i > 1; i--) {
    // Pick a random element to swap with the i-th element.
    int j = rng.nextInt(i);  // 0 <= j <= i-1 (0-based array)
    // Swap array elements.
    int tmp = ats[j];
    ats[j] = ats[i-1];
    ats[i-1] = tmp;
  }
  return ats;
}