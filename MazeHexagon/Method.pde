void addrHexagonLines(float i, float j, boolean[] walls) {
  float xoff = 0;
  if (j%2 == 1) {
    xoff=w/2;
  }
  polygonLines((i+0.5)*w+xoff, (j+1/sqrt(3))*(w/sqrt(3)*3/2), 6, w/sqrt(3), radians(-90), walls);
}

void addrHexagon(float i, float j) {
  float xoff = 0;
  if (j%2 == 1) {
    xoff=w/2;
  }
  polygon((i+0.5)*w+xoff, (j+1/sqrt(3))*(w/sqrt(3)*3/2), 6, w/sqrt(3), radians(-90));
}

void polygon(float x, float y, int n, float r, float rot) {
  beginShape();
  for (float i = 0; i < n; i++) {
    vertex(x+cos(i/n*TWO_PI+rot)*r, y+sin(i/n*TWO_PI+rot)*r);
  }
  endShape();
}

void polygonLines(float x, float y, int n, float r, float rot, boolean[] walls) {
  PVector[] points = new PVector[n];
  for (float i = 0; i < n; i++) {
    points[floor(i)] = new PVector(x+cos(i/n*TWO_PI+rot)*r, y+sin(i/n*TWO_PI+rot)*r);
  }
  for (int i = 0; i < n; i++) {
    if (walls[i]) {
      stroke(255);
    } else {
      noStroke();
    }
    lineVec(points[i], points[(i+1)%n]);
  }
}

void lineVec(PVector a, PVector b) {
  line(a.x, a.y, b.x, b.y);
}

int index(int i, int j, boolean correcting) {
  int xoff = 0;
  if (j%2==1 && correcting) {
    xoff = -1;
  }
  if (i+xoff < 0 || j < 0 || i+xoff > cols-1 || j > rows-1) {
    return 0;
  }
  return i+j*cols+xoff;
}

void removeWalls(Cell a, Cell b) {
  int x = a.i - b.i;
  int y = a.j - b.j;
  int xoff = 0;
  if (a.j%2==0) {
    xoff = -1;
  }
  int offedx = x+xoff;
  if (offedx==-1 && y == -1) {
    a.walls[2] = false;
    b.walls[5] = false;
  }
  if (offedx==0 && y == -1) {
    a.walls[3] = false;
    b.walls[0] = false;
  }
  if (x==1 && y == 0) {
    a.walls[4] = false;
    b.walls[1] = false;
  }
  if (x==-1 && y == 0) {
    a.walls[1] = false;
    b.walls[4] = false;
  }
  if (offedx==-1 && y == 1) {
    a.walls[0] = false;
    b.walls[3] = false;
  }
  if (offedx==0 && y == 1) {
    a.walls[5] = false;
    b.walls[2] = false;
  }
}