class Board

  attr_reader :cells_hash


  def initialize
    @cells_hash = {}

  end

  # cells = {'A1' => <ref to each cell class> }
  # {cell position => ref }
  # position = row + column
  # cells[position] = cell.new(coordinate)

  def cells

    row_letters = ['A', 'B', 'C', 'D']
    column_numbers = [1, 2, 3, 4]

    row_letters.each do |row|
      column_numbers.each do |column|
        coordinate = row + column.to_s
        @cells_hash[coordinate] = Cell.new(coordinate)
      end
    end
    return cells_hash
  end

  def valid_coordinate?(coordinate)
    cells.value?(cells[coordinate])  # within the cells array, fetch the given
                                        # key(coordinate eg "A1")'s value, then check the
                                        # coordinate of the value. cells -> cell -> coordinate
  end



end
