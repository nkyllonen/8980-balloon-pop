/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop

  NOTES:
  1. draw a balloon
  2. move ballon from bottom to top
  3. allow interaction: clicking on balloon? sense collision with another object?
*/

int BG_COLOR = 0;
Balloon[] balloons = new Balloon[1];

// The statements in the setup() function 
// execute once when the program begins
void setup() {
  size(640, 360);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);

  balloons[0] = new Balloon(200, height, 50, 5);
}

// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() {
  background(BG_COLOR);
  
  for (int i = 0; i < balloons.length; i++) {
    balloons[i].move();
    balloons[i].display();
  }
}

/*void mouseClicked() {
  drawBalloon(mouseX, mouseY, 10);
}*/

class Balloon {
  // member variables -- private?
  int xpos;
  int ypos;
  int radius;
  int[] rgb = {204, 102, 0};
  int speed;

  Balloon(int x, int y, int r, int s) {
    xpos = x;
    ypos = y;
    radius = r;
    speed = s;
  }

  void move() {
    ypos = ypos - speed;

    if (ypos < 0) {
      ypos = height;
    }
    
  }

  void display() {
    fill(rgb[0], rgb[1], rgb[2]);
    circle(xpos, ypos, radius);
  }
}
