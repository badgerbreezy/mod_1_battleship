require './lib/gameplay'

class Computer
  attr_reader :computer_board, :player
  def initialize(computer_board)
    @computer_board = computer_board
    @player = player
  end

  def has_lost?
    dead_cells = []
    @computer_board.grid.keys.map do |cell|
      dead_cells << @computer_board.grid[cell].render
    end
    if dead_cells.count("X") == 5
      @has_lost = true
    end
  end

  def ship_placement_random(ship)
    ship_location = determine_possible_placement(ship)
    until @computer_board.place(ship, ship_location.sample)
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

  def render(answer = false)
    column_range = 1..4
    row_range = "A".."D"
    board_rows = []
    top_row ="  " + "1 2 3 4" + " \n"
    row_range.each do |row|
      row_string = row + " "
      column_range.each do |column|
        cell_coordinate = row + column.to_s
        row_string += @grid[cell_coordinate].render(answer) + " "
      end
      board_rows << row_string + "\n"
    end
    puts top_row + board_rows.join
  end

# iteration 4 ahead
  def detect_ship
    ship_location =
    @player.board.grid.keys.find_all do |cell|
      @player.board.grid[cell].ship
    end
  end

  def smart_shots(coordinate)
    row_letter = coordinate[0]
    column_number = coordinate[1].to_i
    possible_coordinates = [(row_letter.ord - 1).chr + column_number.to_s, (row_letter.ord + 1).chr + column_number.to_s, row_letter + (column_number + 1).to_s, row_letter + (column_number - 1).to_s]
  end
end
