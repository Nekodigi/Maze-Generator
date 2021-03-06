int w = 100;

int cols, rows;
Cell[][] grid;
Cell current;
ArrayList<Cell> stack = new ArrayList<Cell>();

void setup(){
  fullScreen(); 
  cols = floor(width/w);
  rows = floor(height/w);
  grid = new Cell[cols][rows];
  for (int j = 0; j < rows; j++){
    for (int i = 0; i < cols; i++){
      Cell cell = new Cell(i, j);
      grid[i][j] = cell;
    }
  }
  current = grid[0][0];
}

void draw(){
  background(51);
  strokeWeight(5);
  for (Cell[] ig : grid){
    for (Cell c : ig){
      c.show();
    }
  }
  
  current.visited = true;
  current.highlight();
  
  Cell next = current.checkNeighbors();
  if(next != null){
    stack.add(current);
    removeWalls(current, next);
    current = next;
  } else if(stack.size() > 0){
    current = stack.remove(stack.size()-1);
  }
  
  ellipse(mouseX, mouseY, 10, 10);
  int i = mouseX/w;
  int j = mouseY/w;
  grid[i][j].highlight();
}
