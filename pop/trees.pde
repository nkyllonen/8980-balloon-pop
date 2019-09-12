
class Node {
  float splitValue;
  Object myObj;
  Node left;
  Node right;
  
  Node(float sv) {
    splitValue = sv;
    left = new Node((1.0/2.0)*splitValue);
    right = new Node(splitValue + (1.0/2.0)*splitValue);
  }

  void buildTree(ArrayList<Object> list) {
    // basecase
    if (list.size() == 1) {
      myObj = list[0];
      return;
    }

    // populate child lists
    ArrayList<Object> leftList = new ArrayList<Object>();
    ArrayList<Object> rightList = new ArrayList<Object>();
    for (Object o: list) {
      if (o.position.x < splitValue) leftList.add(o);
      else rightList.add(o);
    }

    // build child trees
    if (leftList.size() > 0) left.buildTree(leftList);
    if (rightList.size() > 0) right.buildTree(rightList);
  }
}
