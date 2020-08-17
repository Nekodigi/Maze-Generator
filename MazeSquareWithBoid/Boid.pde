class Boid {

  float scale = 5;//10
  PVector pos, vel, accel = new PVector();
  float minSpeed = 5*scale;
  float maxSpeed = 8*scale;
  float seperateWeight = 2.5*10;
  float alignWeight = 1;
  float cohesionWeight = 1;
  float collisionWeight = 100;
  float maxSteerForce = 20;
  float deltaTime = 0.02;

  Boid() {
    pos = new PVector(random(w), random(w));
    vel = new PVector(random(-1, 1), random(-1, 1));
  }

  void update(ArrayList<Boid> boids) {
    accel.add(seperation(boids).mult(seperateWeight));
    accel.add(align(boids).mult(alignWeight));
    accel.add(cohesion(boids).mult(cohesionWeight));
    accel.add(collision().mult(collisionWeight));//-------------will fix
    accel.mult(maxSteerForce);
    //accel.setMag(constrain(accel.mag(), 0, maxSteerForce));
    vel.add(accel.mult(deltaTime));
    vel.setMag(constrain(vel.mag(), minSpeed, maxSpeed));
    pos.add(PVector.mult(vel, deltaTime));
    accel = new PVector();
    edges();
  }

  PVector seperation(ArrayList<Boid> boids) {
    PVector tAccel = new PVector();
    int count = 0;
    for (Boid boid : boids) {
      float sqrD = (pos.x - boid.pos.x)*(pos.x - boid.pos.x) + (pos.y - boid.pos.y)*(pos.y - boid.pos.y);
      if (boid != this && sqrD < seperateR*seperateR) {
        PVector offset = PVector.sub(pos, boid.pos);
        offset.div(sqrD/(scale*scale));
        tAccel.add(offset);
        count++;
      }
    }
    if(count > 0){
      tAccel.div(count);
    }
    return tAccel;
  }

  PVector align(ArrayList<Boid> boids) {
    PVector tAccel = new PVector();
    int count = 0;
    for (Boid boid : boids) {
      float d = PVector.dist(pos, boid.pos);
      if (boid != this && d < perceptR) {
        tAccel.add(boid.vel);
        count++;
      }
    }
    if(count > 0){
      tAccel.div(count);
    }
    return tAccel;
  }

  PVector cohesion(ArrayList<Boid> boids) {
    PVector centre = new PVector();//centre of flockmates
    int count = 0;
    PVector offset = new PVector();
    for (Boid boid : boids) {
      float d = PVector.dist(pos, boid.pos);
      if (boid != this && d < perceptR) {
        centre.add(boid.pos);
        count++;
      }
    }
    if (count != 0) {
      centre.div(count);
      offset = PVector.sub(centre, pos);
    }
    return offset;
  }

  PVector collision() {//approximate solver
    PVector sum = new PVector();
    int i = (int)pos.x/w;
    int j = (int)pos.y/w;
    float px = pos.x%w;
    float py = pos.y%w;
    float dstl = px;//distance to left wall
    float dstt = py;//distance to top wall
    float dstr = w-px;//distance to right wall
    float dstb = w-py;//distance to bottom wall
    Cell c = grid[min(i,cols-1)][min(j,rows-1)];//distance to left wall
    if(!c.walls[3])dstl += w;
    if(!c.walls[0])dstt += w;
    if(!c.walls[1])dstr += w;
    if(!c.walls[2])dstb += w;
    //if(dstl < collisionDst)sum.add((collisionDst-dstl)/collisionDst, 0);
    //if(dstt < collisionDst)sum.add(0, (collisionDst-dstt)/collisionDst);
    //if(dstr < collisionDst)sum.add(-(collisionDst-dstr)/collisionDst, 0);
    //if(dstb < collisionDst)sum.add(0, -(collisionDst-dstb)/collisionDst);
    if(dstl < collisionDst)sum.add(collisionDst/dstl, 0);
    if(dstt < collisionDst)sum.add(0, collisionDst/dstt);
    if(dstr < collisionDst)sum.add(-collisionDst/dstr, 0);
    if(dstb < collisionDst)sum.add(0, -collisionDst/dstb);
    return sum.mult(1);
    //PVector p = new PVector(mouseX/scale, mouseY/scale);
    //float d = PVector.dist(pos, p);
    //if (d < collisionR) {
    //  return PVector.sub(pos, p).normalize();
    //}
    //return new PVector();
  }

  void edges() {
    if (pos.x > width) pos.x = 0;
    if (pos.x < 0) pos.x = width;
    if (pos.y > height) pos.y = 0;
    if (pos.y < 0) pos.y = height;
  }

  void show() {
    fill((vel.heading()+PI)/TWO_PI*360, 100, 100);
    triangle(pos, vel.heading()+HALF_PI, 20);
  }
}
