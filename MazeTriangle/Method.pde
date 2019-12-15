void addrTriangleLines(float i, float j, boolean[] walls) {  
  PVector pos = addr2pos(i, j);
  polygonLines(pos.x, pos.y, 3, w/3*sqrt(3), invTest(i, j), radians(-90), walls);
}

void addrTriangle(float i, float j) {
  PVector pos = addr2pos(i, j);
  polygon(pos.x, pos.y, 3, w/3*sqrt(3), invTest(i, j), radians(-90));
}

PVector addr2pos(float i, float j) {
  float yoff = w/sqrt(3);
  if (invTest(i, j) == -1) {
    yoff+=-w/6*sqrt(3);
  }
  float x = i*w/2 + w/2;
  float y = j*w/2*sqrt(3)+yoff;
  return new PVector(x, y);
}

void polygon(float x, float y, int n, float r, float invY, float rot) {
  beginShape();
  for (float i = 0; i < n; i++) {
    vertex(x+cos(i/n*TWO_PI+rot)*r, y+invY*sin(i/n*TWO_PI+rot)*r);
  }
  endShape();
}

void polygonLines(float x, float y, int n, float r, float invY, float rot, boolean[] walls) {
  PVector[] points = new PVector[n];
  for (float i = 0; i < n; i++) {
    points[floor(i)] = new PVector(x+cos(i/n*TWO_PI+rot)*r, y+invY*sin(i/n*TWO_PI+rot)*r);
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

int index(int i, int j) {
  if (i < 0 || j < 0 || i > cols-1 || j > rows-1) {
    return 0;
  }
  return i+j*cols;
}

void removeWalls(Cell a, Cell b) {
  int x = a.i - b.i;
  if (x==0) {
    a.walls[1] = false;
    b.walls[1] = false;
  } else {
    if (x==1) {
      a.walls[2] = false;
      b.walls[0] = false;
    }

    if (x==-1) {
      a.walls[0] = false;
      b.walls[2] = false;
    }
  }
}

int invTest(float i, float j) {
  if ((i%2+j%2)%2==0) {//is (even,even) (odd, odd)?
    return 1;
  }
  else{
    return -1;
  }
}