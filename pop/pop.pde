/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/

int BG_COLOR = 0;
ArrayList<Balloon> balloons = new ArrayList<Balloon>();
Slider brick;

// The statements in the setup() function 
// execute once when the program begins
void setup() {
  size(640, 360);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);

  balloons.add(new Balloon(200, height, 50, 2));
  balloons.add(new Balloon(400, height, 20, 5));
  brick = new Slider(width/2, 20, 50, 10);
}

// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() {
  background(BG_COLOR);
  
  int index = 0;
  for (Balloon b: balloons) {
    b.move();
   
    if (b.position.y <= 0 - b.radius) {
      balloons.remove(index);
      break;
      //continue; // breaks using continue
    }

    if (b.checkCollision(brick)) {
      b.rgb.x = 0;
    }

    index++;
    b.display();
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
