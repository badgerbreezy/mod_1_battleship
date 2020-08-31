require './lib/ship'

class Board
  attr_reader :grid
  attr_accessor :turn

  def initialize
    @grid = cells
  end

  def cells
    cells_hash = {}
    letter_range = 'A'..'D'
    number_range = [1, 2, 3, 4]

    letter_range.each do |row|
      number_range.each do |column|
        coordinate = row + column.to_s
        cells_hash[coordinate] = Cell.new(coordinate)
      end
    end
    cells_hash
  end

  def valid_coordinate?(coordinate)
    @grid.value?(grid[coordinate])
  end

  def valid_placement?(ship, ship_location)
    return false if length_different?(ship, ship_location)
    return false if columns_rows_nonsequential?(ship, ship_location)
    return false if ship_overlap?(ship, ship_location)

    true
  end

  def place(ship, ship_location)
    if valid_placement?(ship, ship_location)
      ship_location.each do |location|
        @grid[location].place_ship(ship)
      end
      true
    else
      false
    end
  end

  def render(answer = false)
    column_range = 1..4
    row_range = 'A'..'D'
    board_rows = []
    top_row = '  ' + '1 2 3 4' + " \n"
    row_range.each do |row|
      row_string = row + ' '
      # ["A ", "B ", "C ", "D "]
      column_range.each do |column|
        cell_coordinate = row + column.to_s
        # ["A1", "A2",..."D4"]
        row_string += @grid[cell_coordinate].render(answer) + ' '
        # ["A . .  .  . \n", "B . . . . \n"","C . . . \n,"D . . . .\n"]
      end
      board_rows << row_string + "\n"
    end
    top_row + board_rows.join
  end

  # ---------helper methods------------
  def length_different?(ship, ship_location) # TRUE
    ship.length != ship_location.length
  end

  def ship_overlap?(_ship, ship_location)
    ship_location.any? do |location|
      !@grid[location].ship.nil?
    end
  end

  def columns_rows_nonsequential?(ship, ship_location) # TRUE
    if column_coordinates_nonsequential?(ship, ship_location) == true && row_coordinates_nonsequential?(ship, ship_location) == true
      true
    else
      false
    end
  end

  def column_numbers_inconsistent?(_ship, ship_location) # TRUE
    column_numbers_entered = ship_location.map do |location|
      location[1] # ["1", "1", "1"]
    end

    column_numbers_entered[1..-1].all? do |number|
      if number != column_numbers_entered[0]
        return true
      elsif number == column_numbers_entered[0]
        return false
      end
    end
  end

  def column_coordinates_nonsequential?(ship, ship_location) # TRUE
    if column_numbers_inconsistent?(ship, ship_location) == true
      true
    elsif column_numbers_inconsistent?(ship, ship_location) == false
      column_letters_entered = ship_location.map do |location|
        location[0] # ["A", "B", "C"]
      end
      column_letters_test = column_letters_entered.map do |letter|
        letter.ord # [65, 66, 67]
      end
      column_letters_test.each_cons(2).any? do |x, y|
        x != y - 1
      end
    end
  end

  def row_letters_inconsistent?(_ship, ship_location) # TRUE
    row_letters_entered = ship_location.map do |letter|
      letter[0] # ["B", "C", "B"]
    end

    row_letters_entered[1..-1].all? do |number|
      if number != row_letters_entered[0]
        return true
      elsif number == row_letters_entered[0]
        return false
      end
    end
  end

  def row_coordinates_nonsequential?(ship, ship_location) # TRUE
    if row_letters_inconsistent?(ship, ship_location) == true
      true
    elsif row_letters_inconsistent?(ship, ship_location) == false
      row_numbers_entered = ship_location.map do |number|
        number[1] # ["1", "2"]
      end
      row_numbers_integers = row_numbers_entered.map do |a|
        a.to_i # [1, 2]
      end
      row_numbers_integers.each_cons(2).any? do |x, y|
        x != y - 1
      end
    end
  end
end
