require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'

class ComputerTest < Minitest::Test
  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @player_board = Board.new
    computer = Computer.new(@board)

    assert_instance_of Computer, computer
  end

  def test_it_can_determine_possible_placement
    @computer_board = Board.new
    @player_board = Board.new
    computer = Computer.new(@board)
    cruiser = Ship.new("Cruiser", 3)

    assert_equal [["A1", "A2", "A3"], ["B1", "B2", "B3"], ["C1", "C2", "C3"], ["D1", "D2", "D3"], ["A2", "A3", "A4"], ["B2", "B3", "B4"], ["C2", "C3", "C4"], ["D2", "D3", "D4"], ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"], ["A4", "B4", "C4"], ["B1", "C1", "D1"], ["B2", "C2", "D2"], ["B3", "C3", "D3"], ["B4", "C4", "D4"]], computer.determine_possible_placement(cruiser)
  end

  def test_ship_placement_random
skip
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    destroyer = Ship.new("Destroyer", 4)
    @computer_board = Board.new
    @player_board = Board.new
    computer = Computer.new(@computer_board)

    computer.ship_placement_random(cruiser)
    computer.ship_placement_random(submarine)
    computer.ship_placement_random(destroyer)

#binding.pry
    assert_equal
  end

  def test_has_lost?


    computer = Computer.new("Computer Board")
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @player_board = Board.new
    computer = Computer.new(@computer_board)
    computer.ship_placement_random(submarine)
    computer.ship_placement_random(cruiser)
binding.pry
    assert_equal false, computer.has_lost?
  end

end
