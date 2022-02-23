/*
Jumping sketch grid
----------------------
Matthijs van Mierlo
20 February 2022
*/

Grid g;

void setup()
{
  size(750, 750);
  background(255);
  frameRate(60);
  g = new Grid();
}

void keyPressed(){
 saveFrame();
 noLoop();
}

void draw()
{
  //background(255);
  g.updateGrid();
  g.showGrid();
}
