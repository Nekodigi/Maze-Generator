int w = 100;//maze cell size
float perceptR = w/4;
float seperateR = w/2;
float collisionDst = w/2;
int iter = 10;//boid iteration

int cols, rows;
Cell[][] grid;
Cell current;
ArrayList<Cell> stack = new ArrayList<Cell>();
ArrayList<Boid> boids = new ArrayList<Boid>();

void setup(){
  //fullScreen();
  size(1000, 1000);
  colorMode(HSB, 360, 100, 100, 100);
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
  
  for(int i = 0; i < 100; i++){
    boids.add(new Boid());
  }
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
  for(int i=0; i<iter; i++){
  for(Boid boid : boids){
    boid.update(boids);
    boid.show();
  }
  }
}
