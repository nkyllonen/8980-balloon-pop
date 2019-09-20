/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/

// The statements in the setup() function 
// execute once when the program begins
void setup() {
  size(800, 500);     // Size must be the first statement
  stroke(255);        // Set line drawing color to white
  frameRate(10);
  imageMode(CENTER);  // image() will use the center

  brick = new Slider(width/2, 2*brickHeight, brickWidth, brickHeight);
  popFrames = loadFrames("./images/sparkles0.5/pop-sparkles",8);
}

// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() {
  background(BG_COLOR);

  // spawn new balloons
  if (millis() - lastSpawn >= SPAWN_RATE) {
    spawnBalloons(MIN_BALLOONS);
    lastSpawn = millis();
  }

  // place balloons into grid
  //if (balloons.size() > 0) {
  //  grid = new Grid(GRIDCELL_WIDTH, GRIDCELL_HEIGHT);
  //  grid.buildGrid();
  //}
  
  boolean[] toRemove = new boolean[balloons.size()];
  for (int i = 0; i < balloons.size(); i++) {
    Balloon b = balloons.get(i);
    b.move();
   
    if (b.position.y <= 0 - b.radius) {
      toRemove[i] = true;
    }

    // if this balloon collides with the slider
    if (b.checkCollision(brick)) {
      toRemove[i] = true;
      score++;

      // display pop animation
      //popAnimation.display(b.position.x, b.position.y);
      //animations.add(new Animation(b.position.copy(), popFrames, popFrames.length));
      animations.add(new Animation(new PVector(b.position.x, b.position.y), popFrames));
    }
  }

  // remove balloons marked for removal
  for (int i = 0; i < toRemove.length; i++) {
    if (toRemove[i] == true) balloons.remove(i);
  }
  
  // draw the remaining balloons
  for (Balloon b: balloons) {b.display();}

  // prune animations, display remaining animations
  int i = 0;
  while (i < animations.size()) {
    Animation a = animations.get(i);

    // do not increment i if removing
    if (a.frame > a.imageCount - 1) animations.remove(i);
    else {
      a.display();
      i++;
    }
  }

  brick.display();
  displayText();
}
