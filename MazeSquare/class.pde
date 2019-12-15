class Cell{
  int i, j;
  boolean[] walls = {true, true, true, true};
  boolean visited = false;
  
  Cell(int i, int j){
    this.i = i;
    this.j = j;
  }
  
  Cell checkNeighbors(){
    ArrayList<Cell> neighbors = new ArrayList<Cell>();
    
    Cell top = grid.get(index(i, j-1));
    Cell right = grid.get(index(i+1, j));
    Cell bottom = grid.get(index(i, j+1));
    Cell left = grid.get(index(i-1, j));
    
    if(top != null && !top.visited){
      neighbors.add(top);
    }
    if(right != null && !right.visited){
      neighbors.add(right);
    }
    if(bottom != null && !bottom.visited){ 
      neighbors.add(bottom);
    }
    if(left != null && !left.visited){
      neighbors.add(left);
    }
    
    if(neighbors.size() > 0){//randomMove
      int r = floor(random(0, neighbors.size()));//Will be crush sometime?
      return neighbors.get(r);
    }
    else{
      return null;
    }
  }
  
  void highlight(){
    noStroke();
    fill(0, 255, 0, 150);
    rect(addr2pos(this.i), addr2pos(this.j), w, w);
  }
  
  void show(){
    stroke(255);
    int x = addr2pos(this.i);
    int y = addr2pos(this.j);
    if (this.walls[0]) {
      line(x    , y    , x + w, y);
    }
    if (this.walls[1]) {
      line(x + w, y    , x + w, y + w);
    }
    if (this.walls[2]) {
      line(x + w, y + w, x    , y + w);
    }
    if (this.walls[3]) {
      line(x    , y + w, x    , y);
    }
    if(this.visited){
      noStroke();
      fill(255, 0, 255, 150);
      rect(x, y, w, w);
    }
  }
  
  
  
}