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
