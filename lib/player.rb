class Player
  attr_reader :board
  def initialize(board)
    @board = board
  end

  def has_lost?
    dead_cells = []
    board.grid.keys.map do |cell|
      dead_cells << board.grid[cell].render
    end
    if dead_cells.count("X") == 5
      @has_lost = true
    end
  end
end
