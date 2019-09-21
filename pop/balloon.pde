/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/

class Balloon extends Object {
  // member variables -- public
  int radius;
  boolean active = true;
  boolean evil = false;

  Balloon(float x, float y, int r, float s, PVector c) {
    super(new PVector(x, y), millis());
    speed = s;
    radius = r;
    rgb = c;
  }

  void move() {
    if (active) {
      position.y -= speed * (1.0/1000.0)*(millis() - lastSpawn);
      lastSpawn = millis();
    }
  }

  void display() {
    if (active) {
      fill(rgb.x, rgb.y, rgb.z);
      circle(position.x, position.y, radius*2);
    }
  }

  boolean checkCollision(float x, float y) {
    if (x > position.x - radius && x < position.x + radius &&
        y > position.y - radius && y < position.y + radius) {
      return true;
    }
    return false;
  }

  boolean checkCollision(Slider s) {
    // distance between center and slider bottom corners
    float bottomLeft = dist(position.x, position.y, s.position.x, s.position.y + s.h);
    float bottomRight = dist(position.x, position.y, s.position.x + s.w, s.position.y + s.h);

    if (bottomLeft <= radius || bottomRight <= radius) return true;
    else return false;
  }
}
