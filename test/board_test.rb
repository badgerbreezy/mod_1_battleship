require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_has_attributes
    skip
    board = Board.new
  end

  def test_cells # Testing works much easier with small board, otherwise assert_equal will be huge...for now
    skip
    board = Board.new
    cell_1 = Cell.new('A1')
    assert_equal ({ 'A1' => cell_1 }), board.cells
  end

  def test_valid_coordinate?
    board = Board.new
    board.cells

    assert_equal true, board.valid_coordinate?('A1')
    assert_equal true, board.valid_coordinate?('D4')
    assert_equal false, board.valid_coordinate?('A5')
    assert_equal false, board.valid_coordinate?('E1')
    assert_equal false, board.valid_coordinate?('A22')
  end

  def test_valid_placement?
    
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    #same length:
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "A2"])

    #consecutive coordinates
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    #assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    #assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    #assert_equal false, board.valid_placement?(cruiser, ["C1", "B1"])
  end

  def test_length_different?
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    assert_equal true, board.length_different?(cruiser, ["A1", "A2"])
    assert_equal true, board.length_different?(submarine, ["A2", "A3", "A4"])
    assert_equal false, board.length_different?(submarine, ["A2", "A3"])
  end

  def test_column_letters_consistent?
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    assert_equal false, board.column_letters_consistent?(cruiser, ["A1", "A3", "B2"])
    assert_equal true, board.column_letters_consistent?(cruiser, ["A1", "A2", "A3"])
  end

  def test_consecutive_column_coordinates?

    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    assert_equal true, board.consecutive_column_coordinates?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.consecutive_column_coordinates?(cruiser, ["D2", "D3", "D4"])
  end

  def test_row_numbers_consistent?
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    assert_equal false, board.row_numbers_consistent?(cruiser, ["A1", "B1", "C2"])
    assert_equal true, board.row_numbers_consistent?(cruiser, ["B1", "C1", "D1"])
  end

  def test_consecutive_row_coordinates
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    assert_equal true, board.consecutive_row_coordinates(cruiser, ["A1", "B1", "C1"])
    assert_equal false, board.consecutive_row_coordinates(cruiser, ["A2", "C2", "D2"])
  end


  #def test_convert_coordinates
    #board = Board.new
#
    #cruiser = Ship.new('Cruiser', 3)
    #submarine = Ship.new('Submarine', 2)
    #board.convert_coordinates(cruiser, ["A1", "A2", "A3"])
#
#binding.pry
#
    #assert_equal [[65, 49], [65, 50], [65, 51]], board.convert_coordinates(cruiser, ["A1", "A2", "A3"])
  #end
#
  #def test_ordinal_difference
#
    #board = Board.new
    #cruiser = Ship.new('Cruiser', 3)
    #submarine = Ship.new('Submarine', 2)
    #board.convert_coordinates(cruiser, ["A1", "A2", "A3"])
#
    #assert_equal true, board.ordinal_difference
  #end



end


#last_number = column_numbers_test[0]
#column_numbers_test[1, 2].each do |n| # [2, 3, 4]
  #if last_number + 1 != n
    #return false
