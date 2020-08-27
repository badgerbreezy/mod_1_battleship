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
    cell_1 = Cell.new("A1")
    assert_equal ({"A1"=>cell_1}), board.cells

  end

  def test_valid_coordinate?
    board = Board.new
    board.cells

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal false, board.valid_coordinate?("A5") # currently, key exists but coordinate is always nil
  end
end
