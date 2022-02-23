/*
Square grid cells...
*/
public class Cell {

  // Cell needs possible list of balls
  // Since cells can have more than one ball...
  int size;
  ArrayList<Ball> balls = new ArrayList<>();
  color[] colors = new color[]{#CEA7A7, #CEC2A7, #85B9B6, #5F80A2};
  color c;

  public Cell(int size) {
    this.size = size;
    Ball ball = new Ball(int(random(size)), int(random(size)), size / 5);
    balls.add(ball);
    c = colors[int(random(colors.length))];
  }
  public void update() {
    for (Ball ball : balls) {
      ball.update();
    }
  }
  // Show this cell relative to a location on the grid
  public void show(int x, int y) {
    stroke(0);
    strokeWeight(2);
    noFill();
    rect(x, y, size, size);
    if(balls.size() > 1){
     for(int i = 0; i < balls.size() - 1; i++){
       Ball one = balls.get(i);
      for(int j = i+1; j < balls.size(); j++){
        Ball two = balls.get(j);
        if(one.overlapsWith(two)){
          // Style stroke here...
          strokeWeight(1);
          stroke(c, 20);
          fill(c, 20);
          line(one.x + x, one.y + y, two.x + x, two.y + y);
        }
      }
     }
    }
  }

  public ArrayList<Ball> ballsToMove() {
    ArrayList<Ball> returnList = new ArrayList<>();
    for (int i = balls.size() - 1; i >= 0; i--) {
      Ball ball = balls.get(i);
      boolean add = false;
      if (ball.x > size) {
        ball.x = 0;
        add = true;
      }
      if (ball.y > size) {
        ball.y = 0;
        add = true;
      }
      if (ball.x < 0) {
        ball.x = size;
        add = true;
      }
      if (ball.y < 0) {
        ball.y = size;
        add = true;
      }
      if(add){
        returnList.add(balls.remove(i));
      }
    }
    return returnList;
  }
}
