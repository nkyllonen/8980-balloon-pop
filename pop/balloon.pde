class Object {
  // member variables
  PVector position;
  PVector rgb = new PVector(0, 102, 50);
  float speed = 10;

  Object(PVector pos) {
    position = pos;
  }
}

class Balloon extends Object {
  // member variables -- private?
  int radius;

  Balloon(float x, float y, int r, float s) {
    super(new PVector(x, y));
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

class Slider extends Object {
  // member variables
  float w, h;

  Slider(float x, float y, float wid, float hei) {
    // call Object superclass constructor
    super(new PVector(x, y));
    w = wid;
    h = hei;
  }

  void move(int pressedKey) {
    if (pressedKey == RIGHT) position.x += speed;
    if (pressedKey == LEFT) position.x -= speed;
  }

  void display() {
    fill(rgb.x, rgb.y, rgb.z);
    rect(position.x, position.y, w, h);
  }
}
