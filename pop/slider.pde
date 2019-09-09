class Slider extends Object {
  // member variables
  float w, h;

  Slider(float x, float y, float wid, float hei) {
    // call Object superclass constructor
    super(new PVector(x, y, 0));
    w = wid;
    h = hei;
  }

  void move(int pressedKey) {
    if (pressedKey == RIGHT) position.x += speed;
    if (pressedKey == LEFT) position.x -= speed;
  }

  void display() {
    fill(color.x, color.y, color.z);
    rect(position.x, position.y, w, h);
  }

}
