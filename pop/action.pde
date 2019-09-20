/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/
// handle keyboard presses
void keyPressed() {
  if (key == CODED) {
    brick.move(keyCode);
  }
}

// randomize x position, radius, speed, and color
void spawnBalloons(int num) {
  float randx = 200;
  int randr = 50;
  float rands = 2;
  int[] randc = COLORS[0];
  
  for (int i = 0; i < num; i++) {
    randx = random(0, width);
    randr = (int)random(20, 50);
    rands = random(75, MAX_SPEED);
    randc = COLORS[(int)random(0, COLORS.length)];
    balloons.add(new Balloon(randx, height, randr, rands, new PVector(randc[0], randc[1], randc[2])));
  }
}

// display stat values as text
void displayStats() {
  textAlign(LEFT);
  fill(255);
  textSize(18);
  text("LEVEL: " + level, 10, height-30);
  text("SCORE: " + score, 10, height-10);
}

// display level up splash screen
void displayLevelUp() {
  textAlign(CENTER);
  fill(255);
  textSize(50);
  text("LEVEL UP!", width/2, height/2);
}