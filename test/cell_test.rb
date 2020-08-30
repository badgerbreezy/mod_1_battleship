require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def test_it_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_it_has_attributes
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_true_empty? 
    cell = Cell.new("B4")

    assert_equal true, cell.empty?
  end

  def test_false_empty?
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal false, cell.empty?
  end

  def test_place_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal cruiser, cell.ship
  end

  def test_fired_upon?
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal false, cell.fired_upon?
  end



  def test_fire_upon_hit
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    assert_equal 2, cell.ship.health
  end

  def test_render_empty?
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render
  end

  def test_render_miss
    cell_1 = Cell.new("B4")
    cell_1.fire_upon

    assert_equal "M", cell_1.render
  end

  def test_render_hit
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.render
    cell_2.fire_upon

    assert_equal "H", cell_2.render
    assert_equal false, cruiser.sunk?
  end

  def test_render_sunk?
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.render
    cell_2.fire_upon
    cruiser.hit
    cruiser.hit
    cruiser.hit
    cruiser.sunk?

    assert_equal "X", cell_2.render
  end

  def test_sunk?
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.render
    cell_2.fire_upon
    cruiser.hit
    cruiser.hit
    cruiser.hit

    assert_equal true, cruiser.sunk?
  end
end
