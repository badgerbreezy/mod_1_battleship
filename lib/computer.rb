require 'pry'

class Computer


  def initialize(my_board, enemy_board)
    @my_board = my_board
    @enemy_board = enemy_board
    @ships = []
  end

  def place_computer_ships
    #computer has its computer board
    #computer checks to see which cells on the board are valid to place for each ship
      #Each ship has a ship.length
      #valid cells are based on ship.length and must be either horizontal from the starting point or vertical, so [A1, A2, A3] [A2, A3, A4] [B1, B2, B3] [B2, B3, B4] [C1, C2, C3] [C2, C3, C4] [D1, D2, D3] [D2, D3, D4] ////
      #[A1, B1, C1] [B1, C1, D1] [A2, B2, C2] [B2, C2, D2] [A3, B3, C3] [B3, C3, D3] [A4, B4, C4] [B4, C4, D4]
      #When it randomly (.sample) finds ONE of these sets, it places the ship
      #Somehow needs to use this method to determine which set it chooses, then affects computer board



  end

#
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
    #[[1, 2, 3], [2, 3, 4]]
    possible_columns.each do |column_label|
      (1..4).each do |row_label|
        possible_columns_by_row << column_label.map do |column_num|
          (row_label + 64).chr + column_num.to_s
        end
      end
    end

    return possible_columns_by_row + possible_rows_by_column
  end

  def ship_placement_random
  end
  
end
