require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/color'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
binding.pry
class BoardTest < Minitest::Test
  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
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
    #is same length?:
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
    #is consecutive?:
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(cruiser, ["C1", "B1"])
    #is diagonal?:
    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
    #valid?:
    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  def test_it_can_place
    board = Board.new
    board.cells
    cruiser = Ship.new('Cruiser', 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    cell_1.ship
    cell_2.ship
    cell_3.ship

    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_it_can_render
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.grid["A1"]
    cell_2 = board.grid["A2"]
    cell_3 = board.grid["A3"]

    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", board.render
    assert_equal "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n", board.render(true)

  end

  def test_it_can_fire_upon_placed_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    destroyer = Ship.new("Destroyer", 4)
    submarine = Ship.new("Submarine", 2)
    board.place(cruiser, ["A1", "A2", "A3"])
    board.place(destroyer, ["A4", "B4", "C4", "D4"])
    board.place(submarine, ["D1", "D2"])
    board.grid["A1"].fire_upon
    board.grid["A3"].fire_upon
    board.grid["B2"].fire_upon
    board.grid["B4"].fire_upon
    board.grid["C1"].fire_upon
    board.grid["C4"].fire_upon
    board.grid["D1"].fire_upon
    board.grid["D2"].fire_upon

    assert_equal true, board.grid["A1"].fired_upon?
    assert_equal true, board.grid["A3"].fired_upon?
    assert_equal false, board.grid["B2"].fired_upon?
    assert_equal true, board.grid["B4"].fired_upon?
    assert_equal false, board.grid["C1"].fired_upon?
    assert_equal true, board.grid["C4"].fired_upon?
    assert_equal true, board.grid["D1"].fired_upon?
    assert_equal true, board.grid["D2"].fired_upon?
    assert_equal false, cruiser.sunk?
    assert_equal false, destroyer.sunk?
    assert_equal true, submarine.sunk?
    assert_equal "  1 2 3 4 \nA H S H S \nB . M . H \nC M . . H \nD X X . S \n", board.render(true)
  end


#---------------helper tests for test_valid_placement?-----------------
    def test_ships_overlap?
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
    assert_equal true, board.ship_overlap?(submarine, ["A1", "B1"])

    assert_equal false, board.valid_placement?(submarine, ["A1", "B1"])
    assert_equal true, board.valid_placement?(submarine, ["C1", "C2"])
  end

  def test_length_different?
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    assert_equal true, board.length_different?(cruiser, ["A1", "A2"])
    assert_equal true, board.length_different?(submarine, ["A2", "A3", "A4"])
    assert_equal false, board.length_different?(submarine, ["A2", "A3"])
  end

  def test_column_numbers_inconsistent?
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    assert_equal true, board.column_numbers_inconsistent?(cruiser, ["A1", "B2", "C1"])
    assert_equal true, board.column_numbers_inconsistent?(submarine, ["A1", "B2"])
    assert_equal false, board.column_numbers_inconsistent?(submarine, ["A1", "B1"])
    assert_equal false, board.column_numbers_inconsistent?(cruiser, ["A1", "B1", "C1"])
  end

  def test_column_coordinates_nonsequential?
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    assert_equal true, board.column_coordinates_nonsequential?(cruiser, ["A1", "B1", "D1"])
    assert_equal true, board.column_coordinates_nonsequential?(cruiser, ["A3", "A2", "A1"])
    assert_equal true, board.column_coordinates_nonsequential?(submarine, ["A1", "C1"])
    assert_equal true, board.column_coordinates_nonsequential?(submarine, ["C1", "B1"])
    assert_equal false, board.column_coordinates_nonsequential?(submarine, ["B1", "C1"])
    assert_equal false, board.column_coordinates_nonsequential?(cruiser, ["A1", "B1", "C1"])
  end

  def test_row_letters_inconsistent?
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    assert_equal true, board.row_letters_inconsistent?(cruiser, ["B1", "C2", "B3"])
    assert_equal false, board.row_letters_inconsistent?(cruiser, ["A1", "A2", "A3"])
  end

  def test_row_coordinates_nonsequential?
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    assert_equal true, board.row_coordinates_nonsequential?(submarine, ["A3", "A2", "A1"])
    assert_equal true, board.row_coordinates_nonsequential?(submarine, ["D3", "A2"])
    assert_equal true, board.row_coordinates_nonsequential?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.row_coordinates_nonsequential?(submarine, ["C1", "C2"])
    assert_equal false, board.row_coordinates_nonsequential?(cruiser, ["A2", "A3", "A4"])
  end
end
