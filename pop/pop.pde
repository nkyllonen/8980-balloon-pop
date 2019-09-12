/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/

int BG_COLOR = 100;
int MIN_BALLOONS = 1;
int MAX_SPEED = 5;
int SPAWN_RATE = 500;
int lastSpawn = 0;
ArrayList<Balloon> balloons = new ArrayList<Balloon>();
Slider brick;

// The statements in the setup() function 
// execute once when the program begins
void setup() {
  size(640, 360);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(40);

  brick = new Slider(width/2, 20, 50, 10);
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
      b.rgb.x = 0;
    }

    index++;
    b.display();
  }

  brick.display();
}

//void mouseClicked() {
//  //drawBalloon(mouseX, mouseY, 10);
//}

void keyPressed() {
  if (key == CODED) {
    brick.move(keyCode);
  }
}

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
