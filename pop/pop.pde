/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/

// The statements in the setup() function 
// execute once when the program begins
void setup() {
  size(640, 360);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(40);

  brick = new Slider(width/2, 2*brickHeight, brickWidth, brickHeight);
}

// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() {
  background(BG_COLOR);
  if (millis() - lastSpawn >= SPAWN_RATE) {
    spawnBalloons(MIN_BALLOONS);
    lastSpawn = millis();
  }
  
  int index = 0;
  for (Balloon b: balloons) {
    b.move();
   
    if (b.position.y <= 0 - b.radius) {
      balloons.remove(index);
      break;
      //continue; // NOTE: "ConcurrentModificationException" if using continue
    }

    // if this balloon collides with the slider
    if (b.checkCollision(brick)) {
      //b.rgb.x = 0;
      balloons.remove(index);
      break;
    }

    index++;
    b.display();
  }

  brick.display();
}
