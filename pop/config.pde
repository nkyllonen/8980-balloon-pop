/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/
// Colors
int BG_COLOR = 100;
int[][] COLORS = {{255,0,0},{102,102,255},{0, 153, 153},{255,102,178},{255,255,0},{102,0,102},{153,0,76}};

// Balloons
int MIN_BALLOONS = 1;
int MAX_SPEED = 150;
int SPAWN_RATE = 700;
int lastSpawn = 0;
ArrayList<Balloon> balloons = new ArrayList<Balloon>();
Animation popAnimation;

// Spatial Data Struture(s)
//Node root = new Node(width/2.0);
Grid grid;
int GRIDCELL_WIDTH = 100;
int GRIDCELL_HEIGHT = 100;

// Player
Slider brick;
int brickWidth = 50;
int brickHeight = 10;
int score = 0;
