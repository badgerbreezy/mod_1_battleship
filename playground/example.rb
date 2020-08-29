class Dog

  def initialize
  end

...code...
bads = ["BE", "TY"]
  def personality_types(good, bads) # = [[[24, 43], [53, 24]],
    bad_array = []
    bads.map do |bad|
      behavior_array = bad.split('')
      behavior_array.map do |behavior|

        bad_array << behavior.ord
      end
      return =
    end
  end

  def ord_differential
    if bad_array[1][1] - bad_array[0][1] == 1 [[24, 43], [53, 24]]
      true
    else
      false
    end
  end
