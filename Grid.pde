public class Grid {
  int CELL_SIZE = 50;
  Cell[][] cells;
  public Grid() {
    cells = new Cell[int(width / CELL_SIZE)][int(height / CELL_SIZE)];
    for (int row = 0; row < cells.length; row++)
    {
      for (int col = 0; col < cells[0].length; col++) {
        cells[row][col] = new Cell(CELL_SIZE);
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
