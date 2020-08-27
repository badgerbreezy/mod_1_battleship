require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists
    cell = Cell.new("A1")
    board = Board.new
    assert_instance_of Board, board
    assert_instance_of Cell, cell
  end

  def test_it_has_attributes
    skip
    board = Board.new


  end

  def test_grid

    cells = {}
    row_letters = ['A', 'B', 'C', 'D']
    a1 = Cell.new("A1")

    assert_equal 'A1', grid.position
  end
end
