class Board

  attr_reader :cell,
              :cells,
              :coordinate


  def initialize

  end

  # cells = {'A1' => <ref to each cell class> }
  # {cell position => ref }
  # position = row + column
  # cells[position] = cell.new(coordinate)

  def cells
    cells_hash = {}
    row_letters = ['A', 'B', 'C', 'D']
    column_numbers = [1, 2, 3, 4]

    row_letters.each do |row|
      column_numbers.each do |column|
        position = row + column.to_s
        cells_hash[position] = Cell.new(coordinate)
      end
    end
    return cells_hash
  end

  def valid_coordinate?(coordinate)
    cells.fetch(coordinate).coordinate  # within the cells array, fetch the given
                                        # key(coordinate eg "A1")'s value, then check the
                                        # coordinate of the value. cells -> cell -> coordinate
  end

end
