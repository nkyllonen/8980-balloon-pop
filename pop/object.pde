/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/

class Object {
  // member variables
  PVector position;
  PVector rgb = new PVector(0, 102, 50);
  float speed = 75; // pixels/second
  int lastSpawn = 0;

  Object(PVector pos, int t) {
    position = pos;
    lastSpawn = t;
  }

  void display() {}
}
