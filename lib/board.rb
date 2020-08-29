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
# ---------helper methods -------
  def valid_coordinate?(coordinate)
    cells.value?(cells[coordinate])
  end

  def valid_placement?(ship, ship_location)
    #ship length
    if length_difference(ship, ship_location) == true
      return true
    elsif length_difference(ship, ship_location) == false
      return false
    end
      #consecutive coordinates


    #diagonal


  end

  def length_difference(ship, ship_location)
    if ship.length != ship_location.count
      return false
    elsif ship.length == ship_location.count
      return true
    end
  end

  def consecutive_column_coordinates(ship, ship_location)
    column_numbers_pick = ship_location.map do |location|
      location[1] # ["1", "2", "3"]
    end
    column_numbers_test = column_numbers_pick.map do |location|
      location.to_i # [1, 2, 3]
    end

    first_number = column_numbers_test[0]
    column_numbers_test[1..-1].each do |n| # [1, 3, 2]
      if first_number + 1 != n
        return false
      elsif first_number + 1 == n
        return true
      end
    end
    #if column_numbers_test != column_numbers_test.sort
      #false
    #elsif column_numbers_test == column_numbers_test.sort
      #true
    #end

    #column_numbers_test.each_cons(ship.length) do |number|
      #p number
    #end

  #.each_cons
  end

  def consecutive_row_coordinates(ship, ship_location)
    row_letters_pick = ship_location.map do |location|
      location[0] # ["A", "B", "C"]
    end
    row_letters_test = row_letters_pick.map do |a|
      a.ord # [65, 66, 67]
    end
    first_letter = row_letters_test[0]
    row_letters_test[1..-1].each do |n| # [65,66,67]
      if first_letter + 1 != n
        return false
      elsif first_letter + 1 == n
        return true
      end
    end
  end



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
end
