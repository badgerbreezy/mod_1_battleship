require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/color'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
require './lib/computer'


class ComputerTest < Minitest::Test
  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @player_board = Board.new
    computer = Computer.new(@my_board, @enemy_board)
    assert_instance_of Computer, computer

  end

  def test_it_has_attributes
    enemy = Computer.new(@my_board, @enemy_board)
  end

  def test_pry
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @player_board = Board.new
    computer = Computer.new(@my_board, @enemy_board)
    assert_instance_of Computer, computer
    computer.possible_row_placement(cruiser, 3)
    binding.pry
  end

end
