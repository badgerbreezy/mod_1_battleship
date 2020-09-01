class Player
  attr_reader :board
  def initialize(board)
    @board = board
    @has_lost = false
  end

end
