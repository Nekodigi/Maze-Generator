int w = 100;

ArrayList<Cell> grid = new ArrayList<Cell>();
Cell current;
ArrayList<Cell> stack = new ArrayList<Cell>();
int cols, rows;

void setup(){
  fullScreen();
  cols = floor(width/w*2-1);
  rows = floor(height/(w*sqrt(3)/2));
  for(int j = 0; j < rows; j++){
    for(int i = 0; i < cols; i++){
      Cell cell = new Cell(i, j);
      grid.add(cell);
    }
  }
  current = grid.get(0);
  
  
  
  for(int i = 0; i < grid.size(); i++){
    grid.get(i).show();
  }
}

void draw(){
  background(0);
  fill(0);
  strokeWeight(5);
  for(int i = 0; i < grid.size(); i++){
    grid.get(i).show();
  }
  
  current.visited = true;
  current.highlight();
  
  Cell next = current.checkNeighbors();
  if(next != null){
    stack.add(current);
    removeWalls(current, next);
    current = next;
  }
  else if(stack.size() > 0){
    current = stack.remove(stack.size()-1);
  }
}