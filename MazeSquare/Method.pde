int index(int i, int j){
  if(i < 0 || j < 0 || i > cols-1 || j > rows-1){
    return 0;
  }
  return i + j * cols;
}

int addr2pos(int a){
  return a*w;
}

void removeWalls(Cell a, Cell b){
  int x = a.i - b.i;
  if(x == 1){
    a.walls[3] = false;
    b.walls[1] = false;
  } else if (x == -1){
    a.walls[1] = false;
    b.walls[3] = false;
  }
  int y = a.j - b.j;
  if(y == 1){
    a.walls[0] = false;
    b.walls[2] = false;
  } else if(y == -1){
    a.walls[2] = false;
    b.walls[0] = false;
  }
}