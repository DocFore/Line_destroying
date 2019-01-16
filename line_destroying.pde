ArrayList<Line> lines = new ArrayList<Line>();
ArrayList<Point> points = new ArrayList<Point>();
boolean building = false;
int maxp = 0;
int maxl = 0;
int coloMin = 0;
int coloMax = 255;

void setup() {
  size(800, 800);
  background(127);
}

void draw() {
  background(255);

  if (lines.size() != 0) {
    for (int i = lines.size() - 1; i >= 0; i--) {
      Line l = lines.get(i);
      l.show();
      if (l.shouldDie()) {
        lines.remove(i);
      } else {
        l.becomeOlder();
      }
    }
  }

  if (points.size() != 0) {
    for (int  i = points.size() - 1; i >= 0; i--) {
      Point p = points.get(i);
      p.show();
      p.move();

      if (p.canBeSeen == false) {
        points.remove(i);
      }
    }
  }
}

void mouseWheel() {
  for (int i = 0; i < 100; i++) {
    int startX = (int)random(width);
    int startY = (int)random(height);
    int endX   = (int)random(width);
    int endY   = (int)random(height);
    PVector start = new PVector(startX, startY);
    PVector end = new PVector(endX, endY);
    color cligne = color(random(coloMin, coloMax), random(coloMin, coloMax), random(coloMin, coloMax));
    color cpoint = color(random(coloMin, coloMax), random(coloMin, coloMax), random(coloMin, coloMax));
    Line l = new Line(start, end, false, cligne, cpoint);
    lines.add(l);
  }
}
void mousePressed() {
  if (!building) {
    int posX = mouseX;
    int posY = mouseY;
    PVector pos = new PVector(posX, posY);
    color cligne = color(random(coloMin, coloMax), random(coloMin, coloMax), random(coloMin, coloMax));
    color cpoint = color(random(coloMin, coloMax), random(coloMin, coloMax), random(coloMin, coloMax));
    Line l = new Line(pos, pos, true, cligne, cpoint);
    lines.add(l);
    building = true;
  } else {
    PVector pos = new PVector(mouseX, mouseY);
    move(pos, true);
    building = false;
  }
  println(lines.size());
}

void mouseMoved() {
  if (building) {
    move(new PVector(mouseX, mouseY), false);
  }
}

void move(PVector pos, boolean finished) {

  Line l = lines.get(lines.size()-1);
  l.end = pos;
  if (finished) {
    float dist = l.start.dist(l.end);
    float screen = sqrt(height*height + width*width);
    l.lifeSpan = map(dist, 0, screen, 0, random(1000));
    l.building = false;
  }
  lines.set(lines.size()-1, l);
}
