/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop

  NOTES:
  1. draw a balloon
  2. move ballon from bottom to top
  3. allow interaction: clicking on balloon? sense collision with another object?
*/

int BG_COLOR = 0;
final int SCREEN_WIDTH = 640;
final int SCREEN_HEIGHT = 360;
int y = SCREEN_HEIGHT;
int speed = 5;

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
  background(BG_COLOR);
  
  y = y - speed;

  if (y < 0) {
    y = SCREEN_HEIGHT;
  }

  drawBalloon(200, y, 50);
}

// drawBalloon: draw a single ballon at (xloc, yloc)
void drawBalloon(int xloc, int yloc, int radius) {
  //fill(color);
  fill(204, 102, 0);
  circle(xloc, yloc, radius);
}
