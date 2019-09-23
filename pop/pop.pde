/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/

// The statements in the setup() function 
// execute once when the program begins
void setup() {
  size(800, 500);     // Size must be the first statement
  stroke(255);        // Set line drawing color to white
  frameRate(30);
  imageMode(CENTER);  // image() will use the center

  brick = new Slider(width/2, 2*brickHeight, brickWidth, brickHeight);
  popFrames = loadFrames("./images/sparkles0.5/pop-sparkles",8);
  hotFrames = loadFrames("./images/hot-0.5/hot", 11);
}

// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() {
  background(BG_COLOR);

  if (millis() - splashStart > 1000) {
    levelUpScreen = false;
  }

  // display levelup screen
  if (levelUpScreen) {
    displayLevelUp();
  }
  else {
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

    int i = 0;
    while (i < balloons.size()) {
      Balloon b = balloons.get(i);
      b.move();

      if (b.position.y <= 0 - b.radius) {
        balloons.remove(i);
        continue;
      }

      // if this balloon collides with the slider
      if (b.checkCollision(brick)) {        
        if (!b.evil) {
          animations.add(new Animation(b.position.copy(), popFrames));
          score++;
        }
        else {
          animations.add(new Animation(b.position.copy(), hotFrames));
          score--;
        }

        balloons.remove(i);
        continue;
      }

      // only increment if we didn't have to remove
      b.display();
      i++;
    } // WHILE balloons

    // prune animations, display remaining animations
    i = 0;
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
    displayStats();
  }

  // level up screen
  if (score / 10 + 1 > level) {
    levelUpScreen = true;
    splashStart = millis();
  }

  // check score and update level
  level = score / 10 + 1;
  MAX_SPEED = 150 + level * 10;
  brick.speed = 5 + level;
  ENEMY_SPAWN_CHANCE = 0.05 + level * 0.05;
} // END draw()
