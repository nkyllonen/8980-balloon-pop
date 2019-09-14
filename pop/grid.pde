/*
  Nikki Kyllonen - kyllo089
  CSCI 8980 - Assignment 1 - Balloon Pop
*/
class GridCell {
  PVector position; // top left corner
  //ArrayList<Object> objects = new ArrayList<Object>();
  //ArrayList<int> balloonIndices = new ArrayList<int>();
  IntList balloonIndices = new IntList();

  GridCell() {}

  /*void addObject(Object o) {
    objects.add(o);
  }*/

  void addIndex(int i) { balloonIndices.append(i); }

  void display() {
/*    for (Object o: objects) {
      print("[");
      for(float f: o.position.array()) {
        print(f + " , ");
      }
      print("]");
    }*/
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

    // populate cells with GridCells -- nullptrExc without this
    for (int r = 0; r < cells.length; r++) {
      for (int c = 0; c < cells[r].length; c++) {
        cells[r][c] = new GridCell();
      }
    }
  }

  //void buildGrid(ArrayList<Object> objects) {
  void buildGrid() {
    for (int i = 0; i < balloons.size(); i++) {
      Balloon b = balloons.get(i);
      // check center points
      int[] indices = calcCollisionIndices(b.position);
      if (indices != null){
        //print("POS @ (" + b.position.x + " , " + b.position.y + ")");
        //println(" --> [" + indices[0] + " , " + indices[1] + "]");
        addToCell(i, indices);
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

  void addToCell(int i, int[] cellIndices) {
    if (cells != null) cells[cellIndices[0]][cellIndices[1]].addIndex(i);
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
