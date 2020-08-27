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

  def test_grid
    skip
    #how to test for this??
    board = Board.new
    cell = Cell.new("A1")
    assert_equal ({"A1"=>Cell.new(coordinate)}), board.grid

  end
end
