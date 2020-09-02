require './lib/gameplay'

class Computer
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


  def ship_placement_random(ship)
    ship_location = determine_possible_placement(ship)
    until @board.place(ship, ship_location.sample)
    end
  end

  def determine_possible_placement(ship)
    possible_rows = []
    possible_rows_by_column = []
    possible_columns = []
    possible_columns_by_row = []

    (1..4).each_cons(ship.length) do |row|
      row_array = row.map do |num|
        (num + 64).chr
      end
      possible_rows << row_array
    end

    possible_rows.each do |row_label|
      (1..4).each do |column_label|
        possible_rows_by_column << row_label.map do |cap_letter|
          cap_letter + column_label.to_s
        end
      end
    end

    (1..4).each_cons(ship.length) do |column|
      possible_columns << column
    end
    possible_columns.each do |column_label|
      (1..4).each do |row_label|
        possible_columns_by_row << column_label.map do |column_num|
          (row_label + 64).chr + column_num.to_s
        end
      end
    end

    possible_columns_by_row + possible_rows_by_column
  end
end
