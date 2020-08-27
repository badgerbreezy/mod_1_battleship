class Board

  attr_reader :board,
              :cells
  def initialize
    @board = board
    @cells = cells
  end

  # cells = {'A1' => <ref to each cell class> }
  # {cell position => ref }
  # position = row + column
  # cells[position] = cell.new(coordinate)

  def build_board
    cells = {}

    4.times do |row|
      4.times do |column|
        position = row + column.to_s
        cells[position] = cell.new(coordinate)
      end
    end
  end


end
