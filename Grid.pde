public class Grid {
  int CELL_SIZE;
  Cell[][] cells;
  // Default constructor for a grid with cells size 50
  public Grid() {
    CELL_SIZE = 50;
    cells = new Cell[int(width / CELL_SIZE)][int(height / CELL_SIZE)];
    for (int row = 0; row < cells.length; row++)
    {
      for (int col = 0; col < cells[0].length; col++) {
        cells[row][col] = new Cell(CELL_SIZE);
      }
    }
  }
  // Constructor for grid given image
  // ****NOTE for some reason it seems to be flipped over the y-axis...
  public Grid(PImage img) {
    // 2000 x 2000 image
    // Each cell should be 50 pixels each
    CELL_SIZE = 10;
    int numRows = img.height / CELL_SIZE;
    int numCols = img.width / CELL_SIZE;
    cells = new Cell[numRows][numCols];
    for (int row = 0; row < numRows; row++) {
      for (int col = 0; col < numCols; col++) {
        int ravg = 0;
        int gavg = 0;
        int bavg = 0;
        // Each grid cell will be 50 x 50 pixels
        PImage slice = img.get(col * CELL_SIZE, row * CELL_SIZE, CELL_SIZE, CELL_SIZE);
        slice.loadPixels();
        for (int i = 0; i < slice.pixels.length; i++) {
          color c = slice.pixels[i];
          ravg += red(c);
          gavg += green(c);
          bavg += blue(c);
        }
        ravg /= (CELL_SIZE * CELL_SIZE);
        gavg /= (CELL_SIZE * CELL_SIZE);
        bavg /= (CELL_SIZE * CELL_SIZE);
        cells[row][col] = new Cell(CELL_SIZE);
        cells[row][col].c = color(ravg, gavg, bavg);
      }
    }
  }
  public void updateGrid() {
    ArrayList<Ball> toMove = new ArrayList<>();
    // Maybe set a rule for where it teleports to... based on current cell
    // maybe within a certain radius?
    for (Cell[] row : cells) {
      for (Cell c : row) {
        c.update();
        ArrayList<Ball> cellMove = c.ballsToMove();
        for (int i = cellMove.size() - 1; i >= 0; i--) {
          toMove.add(cellMove.remove(i));
        }
      }
    }
    for (int i = 0; i < toMove.size(); i++) {
      Ball curr = toMove.get(i);
      cells[int(random(cells.length))][int(random(cells[0].length))].balls.add(curr);
    }
  }
  public void showGrid() {
    for (int row = 0; row < cells.length; row++)
    {
      for (int col = 0; col < cells[0].length; col++) {
        Cell curr = cells[row][col];
        // Show this cell relative to x, y coordinate of where it should be
        int topleftx = col * CELL_SIZE;
        int toplefty = row * CELL_SIZE;
        curr.show(topleftx, toplefty);
      }
    }
  }
}
