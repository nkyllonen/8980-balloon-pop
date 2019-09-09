/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/

int BG_COLOR = 0;
ArrayList<Balloon> balloons = new ArrayList<Balloon>();
Slider brick;
ArrayList<Object> worldObjects = new ArrayList<Object>();

// The statements in the setup() function 
// execute once when the program begins
void setup() {
  size(640, 360);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);

  balloons.add(new Balloon(200, height, 50, 5));
  brick = new Slider(width/2, 20, 50, 10);
  worldObjects.add(balloons.get(0));
  worldObjects.add(brick);
}

// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() {
  background(BG_COLOR);
  
  for (Balloon b: balloons) {
    b.move();
    //balloons[i].display();
    
    if (b.checkCollision(brick)) {
      b.rgb.x = 0;
    }
  }

  for (Object o : worldObjects) {
    o.display();
  }
}

void mouseClicked() {
  //drawBalloon(mouseX, mouseY, 10);

}

void keyPressed() {
  if (key == CODED) {
    brick.move(keyCode);
  }
}
