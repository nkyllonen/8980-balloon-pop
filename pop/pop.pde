/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/

int BG_COLOR = 0;
Balloon[] balloons = new Balloon[1];
Slider brick;

// The statements in the setup() function 
// execute once when the program begins
void setup() {
  size(640, 360);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);

  balloons[0] = new Balloon(200, height, 50, 5);
  brick = new Slider(width/2, 20, 50, 10);
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
    
    if (balloons[i].checkCollision(brick)) {
      balloons[i].rgb[0] = 0;
    }
  }

  brick.display();
}

void mouseClicked() {
  //drawBalloon(mouseX, mouseY, 10);

}

void keyPressed() {
  if (key == CODED) {
    brick.move(keyCode);
  }
}
