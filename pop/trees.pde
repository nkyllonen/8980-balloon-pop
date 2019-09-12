
class Node {
  ArrayList<Balloon> leftChild = new ArrayList<Balloon>();
  ArrayList<Balloon> rightChild = new ArrayList<Balloon>();
  Node() {}

  void buildTree(float splitValue) {
    for (Balloon b : balloons) {
      if (b.position.x < splitValue) leftChild.add(b);
      else rightChild.add(b);
    }
  }
}
