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
  }

  void move(int pressedKey) {
    if (pressedKey == RIGHT) {
      position.x += speed * (1.0/1000.0)*(millis() - lastSpawn);
      lastSpawn = millis();
    }
    if (pressedKey == LEFT) {
      position.x -= speed * (1.0/1000.0)*(millis() - lastSpawn);
      lastSpawn = millis();
    }

    // check bounds
    if (position.x + w > width) position.x -= w/2;
    if (position.x < 0) position.x += w/2;
  }

  void display() {
    fill(rgb.x, rgb.y, rgb.z);
    rect(position.x, position.y, w, h);
  }
}
