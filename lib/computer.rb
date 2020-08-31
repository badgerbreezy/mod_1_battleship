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
      #Each ship has a length
      #valid cells are based on length and must be either horizontal from the starting point or vertical, so [A1, A2, A3] [A2, A3, A4] [B1, B2, B3] [B2, B3, B4] [C1, C2, C3] [C2, C3, C4] [D1, D2, D3] [D2, D3, D4] ////
      #[A1, B1, C1] [B1, C1, D1] [A2, B2, C2] [B2, C2, D2] [A3, B3, C3] [B3, C3, D3] [A4, B4, C4] [B4, C4, D4]
      #When it randomly (.sample) finds ONE of these sets, it places the ship
      #Somehow needs to use this method to determine which set it chooses, then affects computer board



  end

#



  def possible_row_placement(ship, ship_length)
    possible_rows = []
    possible_columns = []

    (1..4).each_cons(ship_length) do |row|
      row_array = row.map do |num|
        (num + 64).chr

      end
      possible_rows << row_array
    end

    possible_rows.each do |consec_row_label|
      (1..4).each do |column_label|
        possible_columns << consec_row_label.map do |cap_letter|
          cap_letter + column_label.to_s
        end
      end
    end
    p possible_rows
    p possible_columns
  end



  def possible_column_placement
    possible_columns = []

  end

  def ship_placement_random
  end
end
