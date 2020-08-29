require './lib/ship'

class Board
  attr_reader :cells_hash, :ord_array, :ship

  def initialize
    @cells_hash = {}
    #@ord_array = []
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

    #ship length -- If the length of the ship and location are different (TRUE), then it is not a valid placement (FALSE)
    return false if length_different?(ship, ship_location)
    #consecutive coordinates

    #return false if consecutive_column_coordinates?(ship, ship_location)



    # Code reads down through each return, stops if it hits ONE false. Otherwise, valid_placement? == TRUE
    return true



    #diagonal

  end

  def place(ship, ship_location)
    if valid_placement?(ship, ship_location) = true
      take 



  end
# ---------helper methods for valid_placement?-------

  def length_different?(ship, ship_location) # Is the ship length and ship location a different length?
    return ship.length != ship_location.length # If they are different, then length_different? == TRUE
  end

  def column_letters_consistent?(ship, ship_location) # helper for consecutive_column_coordinates
    column_letters_pick = ship_location.map do |location|
      location[0] # ["A", "A", "A"]
    end
    column_letters_pick.all? do |letters|
      letters == column_letters_pick[0]
    end
  end

  def consecutive_column_coordinates?(ship, ship_location)
    if column_letters_consistent?(ship, ship_location) == true
      column_numbers_pick = ship_location.map do |location|
        location[1] # ["1", "2", "4"]
      end

      column_numbers_test = column_numbers_pick.map do |location|
        location.to_i # [1, 2, 4]
      end

      column_numbers_test.each_cons(2).all? do |x,y|
        x == y - 1
      end
    end
  end

  def row_numbers_consistent?(ship, ship_location) # Helper for consecutive_row_coordinates
    row_numbers_pick = ship_location.map do |location|
      location[1]
    end
      row_numbers_pick.all? do |numbers|
      numbers == row_numbers_pick[0]
    end
  end

  def consecutive_row_coordinates?(ship, ship_location)
    if row_numbers_consistent?(ship, ship_location) == true
      row_letters_pick = ship_location.map do |location|
        location[0] # ["A", "B", "C"]
      end

      row_letters_test = row_letters_pick.map do |a|
        a.ord # [65, 66, 67]
      end

      row_letters_test.each_cons(2).all? do |x,y|
        y == x + 1
      end
    end
  end
end


# --------graveyard----------

  #def convert_coordinates(ship, ship_location) # must get result of calling ordinal_difference for columns or for rows
    #ship_location.map do |location|
      #location_split = location.split('')
      #location_split.map do |letter|
        #@ord_array << letter.ord
      #end
    #end
  #end
#
  ##def ord_array_slice
    ##@ord_array   .each_slice(2).to_a
  ##end
#
  #def ordinal_difference_column # helper function for consecutive_coordinates
#
    #if ord_array[2][1] - ord_array[1][1] == 1 && ord_array[1][1] - ord_array[0][1] == 1
      #true
    #elsif ord_array[1][1] - ord_array[0][1] == 1
      #true
    #else
      #false
    #end
  #end


#if column_numbers_test != column_numbers_test.sort
  #false
#elsif column_numbers_test == column_numbers_test.sort
  #true
#end

#column_numbers_test.each_cons(ship.length) do |number|
  #p number
#end

#first_number = column_numbers_test[0]
#column_numbers_test[1..-1].each do |n| # [1, 2, 4]
  #if first_number + 1 != n
    #return false
  #elsif first_number + 1 == n
    #return true
  #end
  #first_number = n
#end

#first_letter = row_letters_test[0]
#row_letters_test[1..-1].each do |n| # [65,66,67]
  #if first_letter + 1 != n
    #return false
  #elsif first_letter + 1 == n
    #return true
  #end
#end
