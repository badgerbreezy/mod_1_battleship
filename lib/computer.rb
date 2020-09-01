require 'pry'

class Computer


  def initialize(computer_board)
    @computer_board = computer_board
  end

  def generate_random_possible_ship_placements(size)
      if size == 2
        possible_ship_placement = possible_columns_by_row(size)
        sub_coords = possible_ship_placement.sample
        check_for_overlap(sub_coords)
      else
        possible_ship_placement = generate_ship_coordinate_placement_horizontal(size) + generate_ship_coordinate_placement_vertical(size)
        cruiser_coords = possible_ship_placement.sample
        cruiser = Ship.new("cruiser", 3)
        @board.place(cruiser,cruiser_coords)
      end
    end

    def ship_placement_random(ship)
      #First ship places onto board
      ship_location = determine_possible_placement(ship).sample

      if @board.ship_overlap?(ship, ship_location) == true

        @computer_board.place(ship, ship_location)

      elsif ship != nil
        @computer_board.ship_overlap?(ship, ship_location) == true
        @board.place(ship, ship_location)
      else
        puts @computer_board.render(true)
      end
      puts @computer_board.render(true)
    end

    def check_for_overlap(ship)


      submarine = Ship.new("submarine", 2)
      if
        generate_random_possible_ship_placements(2)
      else
        @board.place(submarine, sub_coords)
      end
    end

  def determine_possible_placement(ship)
    possible_rows = []
    possible_rows_by_column = []
    possible_columns = []
    possible_columns_by_row = []

    (1..4).each_cons(ship.length) do |row|
      row_array = row.map do |num|
        (num + 64).chr
      end
      possible_rows << row_array
    end

    possible_rows.each do |row_label|
      (1..4).each do |column_label|
        possible_rows_by_column << row_label.map do |cap_letter|
          cap_letter + column_label.to_s
        end
      end
    end

    (1..4).each_cons(ship.length) do |column|
      possible_columns << column
    end
    #[[1, 2, 3], [2, 3, 4]]
    possible_columns.each do |column_label|
      (1..4).each do |row_label|
        possible_columns_by_row << column_label.map do |column_num|
          (row_label + 64).chr + column_num.to_s
        end
      end
    end

    return possible_columns_by_row + possible_rows_by_column
  end





end
