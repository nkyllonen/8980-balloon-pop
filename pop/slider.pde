/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/

class Slider extends Object {
  // member variables
  float w, h;

  Slider(float x, float y, float wid, float hei) {
    // call Object superclass constructor
    super(new PVector(x, y), millis());
    w = wid;
    h = hei;
    speed = 5;
  }

  void move(int pressedKey) {
    if (pressedKey == RIGHT) {
      //position.x += speed * (1.0/1000.0)*(millis() - lastSpawn);
      position.x += speed;
      lastSpawn = millis();
    }
    else if (pressedKey == LEFT) {
      //position.x -= speed * (1.0/1000.0)*(millis() - lastSpawn);
      position.x -= speed;
      lastSpawn = millis();
    }

    // check bounds -- bounce off sidewalls
    if (position.x + w > width) position.x -= w/2;
    if (position.x < 0) position.x += w/2;
  }

  void display() {
    fill(rgb.x, rgb.y, rgb.z);
    rect(position.x, position.y, w, h);
  }
}
