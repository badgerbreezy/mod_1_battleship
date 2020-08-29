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
    #row__letters_pick = ship_location.map do |location|
      #location[0]
    #end
    column_numbers_pick = ship_location.map do |location|
      location[1]
    end
    column_numbers_test = column_numbers_pick.map do |n|
      n.to_i
    end
    if column_numbers_test != column_numbers_test.sort
      false
    elsif column_numbers_test == column_numbers_test.sort
      true
    end





    #column_numbers_test.each_cons(ship.length) do |number|
      #p number
    #end



  #.ord
  #.each_cons
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
