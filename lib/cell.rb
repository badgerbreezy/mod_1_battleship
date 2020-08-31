class Cell
  attr_reader :ship, :coordinate

  attr_accessor :board, :turn
  def initialize(ship = nil, coordinate)
    @coordinate = coordinate
    @ship = ship
    @impacted = false
  end

  def empty?
    true
  end

  def place_ship(ship_variable)
    @ship = ship_variable
    empty? == false
  end

  def fired_upon?
    @impacted == true && @ship.nil? != true
  end

  def fire_upon
    @ship.hit if @ship.nil? == false
    @impacted = true
  end

  def render(answer = false)
    if answer == true && @impacted == false && @ship.nil? == false
      'S'
    elsif @impacted == false
      '.'
    elsif @impacted == true && @ship.nil? == true
      'M'
    elsif @impacted == true && @ship.health == 0
      'X'
    elsif @impacted == true && @ship.nil? == false
      'H'
    end
  end
end
