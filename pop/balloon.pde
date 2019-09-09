class Balloon extends Object {
  // member variables -- private?
  int radius;

  Balloon(float x, float y, int r, float s) {
    super(new PVector(x, y, 0));
    speed = s;
    radius = r;
  }

  void move() {
    position.y -= speed;

    if (position.y < 0) {
      position.y = height;
    }
  }

  void display() {
    fill(color.x, color.y, color.z);
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

