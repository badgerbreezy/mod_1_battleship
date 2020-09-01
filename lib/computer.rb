class Computer
  attr_reader :board
  def initialize(board)
    @board = board
    @has_lost = false
  end


  def has_lost?
    if @board.cell.

  def generate_random_possible_ship_placements(size)
    if size == 2
      possible_ship_placement = generate_ship_coordinate_placement_horizontal(size) + generate_ship_coordinate_placement_vertical(size)
      sub_coords = possible_ship_placement.sample
      check_for_overlap(sub_coords)
    else
      possible_ship_placement = generate_ship_coordinate_placement_horizontal(size) + generate_ship_coordinate_placement_vertical(size)
      cruiser_coords = possible_ship_placement.sample
      cruiser = Ship.new("cruiser", 3)
      @board.place(cruiser,cruiser_coords)
    end
  end

  def check_for_overlap(sub_coords)
    submarine = Ship.new("submarine", 2)
    if @board.ship_overlap?(submarine, sub_coords) == true
      generate_random_possible_ship_placements(2)
    else
      @board.place(submarine, sub_coords)
    end
  end



def generate_ship_coordinate_placement_vertical(size)
    possible_rows = Array.new
    (1..4).each_cons(size) do |vertical_sequence|
      new_array = vertical_sequence.map do |columns_label|
        (columns_label + 64).chr
      end
      possible_rows << new_array
      p possible_rows
    end
    possible_column_coordinates = Array.new
    possible_rows.each do |consec_row_label|
      (1..4).each do |column_label|
        possible_column_coordinates  << consec_row_label.map do |cap_letter|
          cap_letter + column_label.to_s
        end
      end
    end
    possible_column_coordinates
  end

  def generate_ship_coordinate_placement_horizontal(size)
    possible_columns  = Array.new
    (1..4).each_cons(size) do |horizontal_sequence|
      possible_columns << horizontal_sequence
    end
    # possible_columns = [[1, 2, 3], [2, 3, 4]]
    possible_column_coordinates = Array.new
    possible_columns.each do |consec_column_label|
      (1..4).each do |row_label|
        possible_column_coordinates  << consec_column_label.map do |column_num|
          (row_label + 64).chr + column_num.to_s
        end
      end
    end

    possible_column_coordinates
    # require "pry"; binding.pry
  end
end
