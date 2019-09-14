/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/
class GridCell {
  PVector position; // top left corner
  ArrayList<Object> objects = new ArrayList<Object>();

  GridCell() {}

  void addObject(Object o) {
    objects.add(o);
  }

  void display() {
    for (Object o: objects) {
      print("[");
      for(float f: o.position.array()) {
        print(f + " , ");
      }
      print("]");
    }
  }
}

class Grid {
  GridCell[][] cells;
  float cellWidth;
  float cellHeight;

  Grid(float cw, float ch) {
    cellWidth = cw;
    cellHeight = ch;
    cells = new GridCell[ceil(height/cellHeight)][ceil(width/cellWidth)]; // [cols][rows]

    // populate cells with GridCells
    for (int r = 0; r < cells.length; r++) {
      for (int c = 0; c < cells[r].length; c++) {
        cells[r][c] = new GridCell();
      }
    }
  }

  //void buildGrid(ArrayList<Object> objects) {
  void buildGrid() {
    for (Balloon b: balloons) {
      // check center points
      int[] indices = calcCollisionIndices(b.position);
      if (indices != null){
        print("POS @ (" + b.position.x + " , " + b.position.y + ")");
        println(" --> [" + indices[0] + " , " + indices[1] + "]");
        addToCell(b, indices);
      }
    }
  }

  // return { row , col }
  int[] calcCollisionIndices(PVector pt) {
    // check bounds
    if (pt.x < width && pt.y < height && pt.x > 0 && pt.y > 0) {
      return new int[] {floor(pt.y / cellHeight), floor(pt.x / cellWidth)};
    }
    else return null;
  }

  void addToCell(Object obj, int[] cellIndices) {
    if (cells != null) cells[cellIndices[0]][cellIndices[1]].addObject(obj);
  }

  void display() {
    for (int r = 0; r < cells.length; r++) {
      for (int c = 0; c < cells[r].length; c++) {
        cells[r][c].display();
      }
      println("-------------------------------");
    }
  }
}
