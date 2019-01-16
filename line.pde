class Line {
  PVector start;
  PVector end;
  float lifeTime;
  float lifeSpan;
  boolean building;
  color cLine; 
  color cPoints;

  Line(PVector start, PVector end, boolean building, color cLine, color cPoints) {
    this.start = start;
    this.end = end;
    lifeTime = 0;
    lifeSpan = random(20, 200);
    this.building = building;
    this.cLine = cLine;
    this.cPoints = cPoints;
  }


  void show() {
    stroke(cLine);
    strokeWeight(5);
    line(start.x, start.y, end.x, end.y);


    stroke(cPoints);
    strokeWeight(10);
    point(start.x, start.y);
    point(end.x, end.y);
  }

  boolean shouldDie() {
    if (lifeTime > lifeSpan && !building) {
      float dist = 15;
      float distance = start.dist(end);
      PVector director = new PVector(end.x - start.x, end.y - start.y);
      director.div(distance);

      for (int  i = 0; i < distance; i += dist) {
        PVector pos = new PVector(start.x + i * director.x, start.y + i  * director.y);
        Point p = new Point(pos, random(10, 30), color(random(coloMin, coloMax), random(coloMin, coloMax), random(coloMin, coloMax)));
        points.add(p);
      }
      return true;
    } else {
      return false;
    }
  }
  void becomeOlder(){
   if (!building){
     lifeTime++;
   }
  }
}
