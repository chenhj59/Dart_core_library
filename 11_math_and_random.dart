// math and random:https://dart.dev/guides/libraries/library-tour#dartmath---math-and-random
import 'dart:math';

void main() {}
// Trigonometry:https://dart.dev/guides/libraries/library-tour#trigonometry
void Trigonometry() {
  //The Math library provides basic trigonometric functions
  // Cosine
  assert(cos(pi) == -1.0);

  // Sine
  var degrees = 30;
  var radians = degrees * (pi / 180);
  // radians is now 0.52359
  var sinOf30degrees = sin(radians);
  // sin 30° = 0.5
  assert((sinOf30degrees - 0.5).abs() < 0.01);
}

//Maximum and minimum:https://dart.dev/guides/libraries/library-tour#maximum-and-minimum
void max_min() {
  //The Math library provides max() and min() methods
  assert(max(1, 1000) == 1000);
  assert(min(1, -1000) == -1000);
}

//Math constants:https://dart.dev/guides/libraries/library-tour#math-constants
void math_constant() {
  //Find your favorite constants—pi, e, and more—in the Math library
  // See the Math library for additional constants
  print(e);
  print(pi);
  print(sqrt2);
}

//Random numbers:https://dart.dev/guides/libraries/library-tour#random-numbers
void random_number() {
  /*Generate random numbers with the Random class.
   You can optionally provide a seed to the Random constructor
   */
  var random = Random();
  random.nextDouble();
  random.nextInt(10);

  random.nextBool();
}
