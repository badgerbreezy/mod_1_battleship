class Board
  attr_reader :cells_hash

  def initialize
    @cells_hash = {}
  end

  def cells
    row_letters = ['A', 'B', 'C', 'D']
    column_numbers = [1, 2, 3, 4]

    row_letters.each do |row|
      column_numbers.each do |column|
        coordinate = row + column.to_s
        @cells_hash[coordinate] = Cell.new(coordinate)
      end
    end
    @cells_hash
  end

  def valid_coordinate?(coordinate)
    cells.value?(cells[coordinate])
  end

  def valid_placement?(ship, ship_location)
    if ship.length != ship_location.count
      return false
    elsif ship.length == ship_location.count
      return true
    elsif ship_location
    end
  end


end
