class Point {
  PVector pos;
  PVector vel;
  color c;
  float size;
  boolean canBeSeen;

  Point(PVector pos, float size, color c) {
    this.pos = pos;
    this.size = size;
    this.c = c;
    this.vel = new PVector(random(-5, 5), random(-5, 5));
    canBeSeen = true;
  }

  void show() {
    stroke(c);
    strokeWeight(size);
    point(pos.x, pos.y);
  }
  
  void move() {
    PVector velo = new PVector(vel.x, vel.y);
    pos.add(velo);
    if(pos.x > width + size || pos.x < - size || pos.y > height + size || pos.y < - size){
      canBeSeen = false;
    }
  }
  
}
