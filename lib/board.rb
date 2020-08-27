class Board

  attr_reader :cell,
              :cells

  def initialize

  end

  # cells = {'A1' => <ref to each cell class> }
  # {cell position => ref }
  # position = row + column
  # cells[position] = cell.new(coordinate)

  def cells
    cells_hash = {}
    row_letters = ['A', 'B']
    column_numbers = [1, 2]

    row_letters.each do |row|
      column_numbers.each do |column|
        position = row + column.to_s
        cells_hash[position] = Cell.new(position)
      end
    end
    return cells_hash
  end


end
