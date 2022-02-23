public class Ball {
  int x;
  int y;
  int dx;
  int dy;
  int diam;
  int[] dir = new int[]{-4, -3, -2, -1, 0, 0, 1, 2, 3, 4};
  public Ball(int x, int y, int diam) {
    this.x = x;
    this.y = y;
    this.dx = dir[int(random(dir.length))];
    this.dy = dir[int(random(dir.length))];
    while (dx == 0 && dy == 0) {
      this.dx = dir[int(random(dir.length))];
      this.dy = dir[int(random(dir.length))];
    }
    this.diam = diam;
  }
  public void update() {
    x += dx;
    y += dy;
  }
  public void show(int refX, int refY) {
    fill(0, 0, 0, 50);
    stroke(0, 0, 0, 50);
    circle(this.x + refX, this.y + refY, diam);
  }
  public boolean overlapsWith(Ball other){
   if(dist(x, y, other.x, other.y) > diam){
    return true;
   }
   return false;
  }
}
