require 'minitest/autorun'
require 'minitest/pride'
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

  def test_cells

    #how to test for this??
    board = Board.new
    cell_1 = Cell.new("A1")
    assert_equal ({"A1"=>cell_1}), board.cells

  end
end
