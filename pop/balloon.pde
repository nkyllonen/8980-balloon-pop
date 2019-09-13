/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/

class Balloon extends Object {
  // member variables -- public
  int radius;

  Balloon(float x, float y, int r, float s, PVector c) {
    super(new PVector(x, y), millis());
    speed = s;
    radius = r;
    //rgb = new PVector(100, 0, 50);
    rgb = c;
  }

  void move() {
    position.y -= speed * (1.0/1000.0)*(millis() - lastSpawn);
    lastSpawn = millis();
  }

  void display() {
    fill(rgb.x, rgb.y, rgb.z);
    circle(position.x, position.y, radius*2);
  }

  boolean checkCollision(float x, float y) {
    if (x > position.x - radius && x < position.x + radius &&
        y > position.y - radius && y < position.y + radius) {
      return true;
    }
    return false;
  }

  boolean checkCollision(Slider s) {
    float dist = dist(position.x, position.y, s.position.x + s.h, s.position.y);

    if (dist <= radius) return true;
    else return false;
  }
}
