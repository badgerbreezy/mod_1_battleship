require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/gameplay'
require './lib/computer'


class ComputerTest < Minitest::Test
  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @player_board = Board.new
    computer = Computer.new(@computer_board)
    assert_instance_of Computer, computer

  end

  def test_it_has_attributes
    computer = Computer.new(@computer_board)
  end

  def test_it_can_determine_possible_placement
    @computer_board = Board.new
    @player_board = Board.new
    computer = Computer.new(@computer_board)
    cruiser = Ship.new("Cruiser", 3)

    assert_equal [["A1", "A2", "A3"], ["B1", "B2", "B3"], ["C1", "C2", "C3"], ["D1", "D2", "D3"], ["A2", "A3", "A4"], ["B2", "B3", "B4"], ["C2", "C3", "C4"], ["D2", "D3", "D4"], ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"], ["A4", "B4", "C4"], ["B1", "C1", "D1"], ["B2", "C2", "D2"], ["B3", "C3", "D3"], ["B4", "C4", "D4"]], computer.determine_possible_placement(cruiser)
  end

  def test_it_can_place_ships_at_random
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @player_board = Board.new
    computer = Computer.new(@computer_board)
    computer.ship_placement_random(submarine)
    computer.ship_placement_random(cruiser)


  end


  def test_pry
    
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @player_board = Board.new
    computer = Computer.new(@computer_board)
    computer.determine_possible_placement(cruiser)
    computer.determine_possible_placement(submarine)
    computer.ship_placement_random(submarine)
    computer.ship_placement_random(cruiser)
binding.pry
  end

end
