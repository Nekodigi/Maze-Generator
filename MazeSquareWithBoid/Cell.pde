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
    
    Cell top = grid[i][max(j-1, 0)];
    Cell right = grid[min(i+1, cols-1)][j];
    Cell bottom = grid[i][min(j+1, rows-1)];
    Cell left = grid[max(i-1, 0)][j];
    
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
    fill(100, 100, 100, 50);
    rect(addr2pos(this.i), addr2pos(this.j), w, w);
  }
  
  void show(){
    stroke(360, 50);
    int x = addr2pos(this.i);
    int y = addr2pos(this.j);
    if (this.walls[0]) {//top
      line(x    , y    , x + w, y);
    }
    if (this.walls[1]) {//right
      line(x + w, y    , x + w, y + w);
    }
    if (this.walls[2]) {//bottom
      line(x + w, y + w, x    , y + w);
    }
    if (this.walls[3]) {//left
      line(x    , y + w, x    , y);
    }
    if(this.visited){
      noStroke();
      fill(300, 100, 100, 50);
      rect(x, y, w, w);
    }
  }
}
