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
    randr = (int)random(20, 50);
    randx = random(0 + randr, width - randr);
    rands = random(75, MAX_SPEED);
    randc = COLORS[(int)random(0, COLORS.length)];

    Balloon b = new Balloon(randx, height, randr, rands, new PVector(randc[0], randc[1], randc[2]));
    
    // is this one evil?
    if (random(1) <= ENEMY_SPAWN_CHANCE) {
      b.evil = true;
      b.rgb = new PVector(0,0,0);
    }

    balloons.add(b);
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
  text("NEXT LEVEL!", width/2, height/2);
}

// void spawnEnemies() {
//   float randx = width/2;
//   int randr = 50;
//   float rands = 2;
//   int[] rgb = {0,0,0};

//   for (int i = 0; i < enemies.length; i++) {
//     randr = (int)random(20, 50);
//     randx = random(0 + randr, width - randr);
//     rands = random(100, MAX_SPEED);

//     enemies[i] = new Balloon(randx, height, randr, rands, rgb);
//     enemies[i].active = false;
//   }
// }