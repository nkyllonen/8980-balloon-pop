/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/
// Colors
int BG_COLOR = 100;

// Balloons
int MIN_BALLOONS = 1;
int MAX_SPEED = 5;
int SPAWN_RATE = 700;
int lastSpawn = 0;
ArrayList<Balloon> balloons = new ArrayList<Balloon>();

// Player
Slider brick;
int brickWidth = 50;
int brickHeight 10;
int score = 0;
