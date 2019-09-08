class Slider {
  // member variables
  float xpos; // upperleft x
  float ypos; // upperleft y
  float w;
  float h;
  int[] rgb = {0, 102, 50};
  float speed = 10;

  Slider(float x, float y, float wid, float hei) {
    xpos = x;
    ypos = y;
    w = wid;
    h = hei;
  }

  void move(int pressedKey) {
    if (pressedKey == RIGHT) xpos += speed;
    if (pressedKey == LEFT) xpos -= speed;
  }

  void display() {
    fill(rgb[0], rgb[1], rgb[2]);
    rect(xpos, ypos, w, h); 
  }

}
