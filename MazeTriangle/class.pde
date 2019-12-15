class Cell{
  int i, j;
  boolean visited = false;
  boolean[] walls = {true, true, true};
  
  Cell(int i, int j){
    this.i = i; 
    this.j = j;
  }
  
  void show(){
    noStroke();
    fill(0);
    addrTriangle(i, j);
    if(visited){
      fill(255, 0, 255, 150);
      addrTriangle(i, j);
    }
    stroke(255);
    addrTriangleLines(i, j, walls);
  }
  
  void highlight(){
    noStroke();
    fill(0, 255, 0, 150);
    addrTriangle(i, j);
  }
  
  Cell checkNeighbors(){
    ArrayList<Cell> neighbors = new ArrayList<Cell>();
    
    Cell Y = grid.get(index(i, j+invTest(i, j)));
    Cell L = grid.get(index(i-1, j));
    Cell R = grid.get(index(i+1, j));
    if(Y != null && !Y.visited){
      neighbors.add(Y);
    }
    if(L != null && !L.visited){
      neighbors.add(L);
    }
    if(R != null && !R.visited){
      neighbors.add(R);
    }
    if(neighbors.size() > 0){
      int r = floor(random(0, neighbors.size()));//Will be crush sometime?
      return neighbors.get(r);
    }
    else{
      return null;
    }
  }
}