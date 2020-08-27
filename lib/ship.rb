class Ship
  attr_reader :name, :length, :health
  def initialize(name, length)
    @name = name
    @length = length
    #this will have to change when we use subs - subs have only 2 health
    @health = 3
  end

  def sunk?
    if @health == 0
      true
    end
  end

  def hit
    @health -= 1
  end
end
