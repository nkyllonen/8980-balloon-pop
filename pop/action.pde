/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/
//
void keyPressed() {
  if (key == CODED) {
    brick.move(keyCode);
  }
}

//
void spawnBalloons(int num) {
  float randx = 200;
  int randr = 50;
  float rands = 2;
  
  for (int i = 0; i < num; i++) {
    randx = random(0, width);
    randr = (int)random(20, 50);
    rands = random(2, MAX_SPEED);
    balloons.add(new Balloon(randx, height, randr, rands));
  }
}
