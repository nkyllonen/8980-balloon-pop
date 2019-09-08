class Balloon {
  // member variables -- private?
  float xpos;
  float ypos;
  int radius;
  int[] rgb = {204, 102, 0};
  float speed;

  Balloon(float x, float y, int r, float s) {
    xpos = x;
    ypos = y;
    radius = r;
    speed = s;
  }

  void move() {
    ypos = ypos - speed;

    if (ypos < 0) {
      ypos = height;
    }
    
  }

  void display() {
    fill(rgb[0], rgb[1], rgb[2]);
    circle(xpos, ypos, radius*2);
  }

  boolean checkCollision(float x, float y) {
    if (x > xpos - radius && x < xpos + radius &&
        y > ypos - radius && y < ypos + radius) {
      return true;
    }
    return false;
  }

  boolean checkCollision(Slider s) {
    float dist = dist(xpos, ypos, s.xpos + s.h, s.ypos);

    if (dist <= radius) return true;
    else return false;
  }
}

