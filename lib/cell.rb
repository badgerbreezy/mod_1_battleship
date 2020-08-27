class Cell

  attr_reader :coordinate,
              :ship


  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @impact = false
    

  end

  def empty?
    if ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  #def impact
    #if @ship == nil
      #return false
    #elsif ship.health < ship.length
      #return true
    #end
  #end


  def fired_upon?
    if ship.health == ship.length
      return false
    elsif ship.health < ship.length
      return true

    end
  end

  def fire_upon
    @impact = false
    if empty? == false
      ship.hit
    elsif empty? == true
    end
  end

  def render(answer = true)
    if empty? == true
      return "."
    elsif empty? == false && answer == true && fired_upon? == false
      return "S"
    elsif @ship != ship && empty? == true
      return "M"
    elsif fired_upon? == true && empty? == false && ship.health != 0
      return "H"
    elsif ship.sunk? == true && ship.health == 0
      return "X"

      # if answer == true && @impacted == false && @ship.nil? == false
        # return "S"
      # elsif @impacted == false
        # return "."
      # elsif @impacted == true && @ship.nil? == true
        # return "M"
      # elsif @impacted == true && @ship.health == 0
        # return "X"
      # elsif @impacted == true && @ship.nil? == false
    end

  end
end
