require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/color'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
binding.pry
class TurnTest < Minitest::Test
  def test_it_exists
    turn = Turn.new

    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
  end

  def test_game_setup
    board = Board.new

  end
  def test_fire_upon_same_cell_is_invalid
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    board.grid["A1"].fired_upon?

    board.grid["A1"].fired_upon?


  # !!!!! assert_equal true, board.grid["A2"].fire_upon #If fired_upon on same  location, it will take health away again




  end
end
