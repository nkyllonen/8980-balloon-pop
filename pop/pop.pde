/*
  1. draw a balloon
  2. move ballon from bottom to top
  3. allow interaction: clicking on balloon? sense collision with another object?
*/

// The statements in the setup() function 
// execute once when the program begins
void setup() {
  size(640, 360);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);
}
// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() {
  drawBalloon(200, 200, 50); 
}

// drawBalloon: draw a single ballon at (xloc, yloc)
void drawBalloon(float xloc, float yloc, int radius) {
  circle(xloc, yloc, radius);
}
