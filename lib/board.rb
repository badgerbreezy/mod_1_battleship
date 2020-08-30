require './lib/ship'

class Board
  attr_reader :grid, :ship

  def initialize
    @grid = cells

  end

  def cells
    cells_hash = Hash.new
    letter_range = 'A'..'D'
    number_range = [1, 2, 3, 4]

    letter_range.each do |row|
      number_range.each do |column|
        coordinate = row + column.to_s
        cells_hash[coordinate] = Cell.new(coordinate)
      end
    end

    return cells_hash
  end

  def valid_coordinate?(coordinate)
    @grid.value?(grid[coordinate])
  end

  def valid_placement?(ship, ship_location)
    return false if length_different?(ship, ship_location)
    return false if columns_rows_nonsequestional?(ship, ship_location)
    return false if ship_overlap?(ship, ship_location)


    # Code reads down through each return, stops if it hits ONE false. Otherwise, valid_placement? == TRUE
    return true
  end

  def place(ship, ship_location)
    if valid_placement?(ship, ship_location)
      ship_location.each do |location|
        @grid[location].place_ship(ship)
      end
      return true
    else
      return false
    end
      #take the ship_location array and for each location and cell,
      #turn each ship = nil to ship
  end
# ---------helper methods for valid_placement?-------

  def length_different?(ship, ship_location) #TRUE
    ship.length != ship_location.length
  end

  def ship_overlap?(ship, ship_location)
    ship_location.any? do |location|
      @grid[location].ship != nil
    end

  end

  def columns_rows_nonsequestional?(ship, ship_location) #TRUE
    if column_coordinates_nonsequential?(ship, ship_location) == true &&    row_coordinates_nonsequential?(ship, ship_location) == true
      return true
    else
      return false
    end
  end

  def column_numbers_inconsistent?(ship, ship_location) #TRUE
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

  def column_coordinates_nonsequential?(ship, ship_location) #TRUE
    if column_numbers_inconsistent?(ship, ship_location) == true
      return true
    elsif column_numbers_inconsistent?(ship, ship_location) == false
      column_letters_entered = ship_location.map do |location|
        location[0] # ["A", "B", "C"]
      end
      column_letters_test = column_letters_entered.map do |letter|
        letter.ord # [65, 66, 67]
      end
      column_letters_test.each_cons(2).any? do |x,y|
        x != y - 1
      end
    end
  end

  def row_letters_inconsistent?(ship, ship_location) #TRUE
    row_letters_entered = ship_location.map do |letter|
      letter[0] #["B", "C", "B"]
    end
    row_letters_entered[1..-1].all? do |number|
      if number != row_letters_entered[0]
        return true
      elsif number == row_letters_entered[0]
        return false
      end
    end
  end

  def row_coordinates_nonsequential?(ship, ship_location) #TRUE
    if row_letters_inconsistent?(ship, ship_location) == true
      return true
    elsif row_letters_inconsistent?(ship, ship_location) == false
      row_numbers_entered = ship_location.map do |number|
        number[1] # ["1", "2"]
      end
      row_numbers_integers = row_numbers_entered.map do |a|
        a.to_i # [1, 2]
      end
      row_numbers_integers.each_cons(2).any? do |x,y|
        x != y - 1
      end
    end
  end
end
#def column_coordinates_nonsequential?(ship, ship_location)
  #if column_numbers_inconsistent?(ship, ship_location) == true
    #return true
#
  #elsif column_numbers_inconsistent?(ship, ship_location) == false
    #column_letters_entered = ship_location.map do |location|
      #location[0] # ["A", "B", "C"]
    #end
#
    #column_letters_test = column_letters_entered.map do |letter|
      #letter.ord # [65, 66, 67]
    #end
#
    #column_letters_test.each_cons(2).all? do |x,y|
      #if x != y - 1
        #return true
      #elsif x == y - 1
        #return false
      #end
    #end
  #end
#end

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
