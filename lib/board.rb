class Board

  attr_reader :board,
              :cell,
              :cells
  def initialize
    @cells = {}
  end

  # cells = {'A1' => <ref to each cell class> }
  # {cell position => ref }
  # position = row + column
  # cells[position] = cell.new(coordinate)

  def grid
    cells = {}
    row_letters = ['A', 'B', 'C', 'D']
    column_numbers = [1, 2, 3, 4]

    row_letters.each do |row|
      column_numbers.each do |column|
        position = row + column.to_s
        @cells[position] = Cell.new(coordinate)
      end
    end
    return @cells
  end


end
