class Cell{
  int i, j;
  boolean visited = false;
  boolean[] walls = {true, true, true, true, true, true};
  
  Cell(int i, int j){
    this.i = i; 
    this.j = j;
  }
  
  void show(){
    noStroke();
    fill(0);
    addrHexagon(i, j);
    if(visited){
      fill(255, 0, 255, 150);
      addrHexagon(i, j);
    }
    stroke(255);
    addrHexagonLines(i, j, walls);
  }
  
  void highlight(){
    noStroke();
    fill(0, 255, 0, 150);
    addrHexagon(i, j);
  }
  
  Cell checkNeighbors(){
    ArrayList<Cell> neighbors = new ArrayList<Cell>();
    
    Cell TL = grid.get(index(i, j+1, true));
    Cell TR = grid.get(index(i+1, j+1, true));
    Cell L = grid.get(index(i-1, j, false));
    Cell R = grid.get(index(i+1, j, false));
    Cell BL = grid.get(index(i, j-1, true));
    Cell BR = grid.get(index(i+1, j-1, true));
    /*print(str(i)+","+str(j));
    print(str(TL.i)+","+str(TL.j));
    print(str(TR.i)+","+str(TR.j));
    print(str(L.i)+","+str(L.j));
    print(str(R.i)+","+str(R.j));
    print(str(BL.i)+","+str(BL.j));
    print(str(BR.i)+","+str(BR.j));*/
    if(TL != null && !TL.visited){
      neighbors.add(TL);
    }
    if(TR != null && !TR.visited){
      neighbors.add(TR);
    }
    if(L != null && !L.visited){
      neighbors.add(L);
    }
    if(R != null && !R.visited){
      neighbors.add(R);
    }
    if(BL != null && !BL.visited){
      neighbors.add(BL);
    }
    if(BR != null && !BR.visited){
      neighbors.add(BR);
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