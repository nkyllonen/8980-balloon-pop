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

