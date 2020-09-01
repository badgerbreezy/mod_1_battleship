class Gameplay
  attr_reader :computer, :player, :player_cruiser, :player_sub
  def initialize(computer, player)
    @computer = computer
    @player = player
    @player_cruiser = player_cruiser
    @player_sub = player_sub
  end

  def menu
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit."
  ">"
  reply = gets.chomp.downcase
    if reply == 'p'
      set_up
    elsif reply == 'q'
      menu
    end
  end

  def set_up
    @computer.generate_random_possible_ship_placements(3)
    @computer.generate_random_possible_ship_placements(2)
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    @player.board.render
    puts "Enter the squares for the Cruiser (3 spaces):"
    puts ">"
    entry_1 = gets.chomp.upcase.split(" ")
    # require "pry"; binding.pry
    # player_crusier = Ship.new("cruiser", 3 )
    until @player.board.valid_coordinate?(entry_1[0]) == true && @player.board.valid_coordinate?(entry_1[1]) == true && @player.board.valid_coordinate?(entry_1[2])
      puts "Those are invalid coordinates. Please try again:"
      puts ">"
      entry_1 = gets.chomp.upcase.split(" ")
    end
    @player_cruiser = Ship.new("cruiser", 3 )
    @player.board.place(player_cruiser, entry_1)
    @player_sub = Ship.new("submarine", 2 )
    p "Enter the squares for the Submarine (2 spaces)"
    p ">"
    entry_2 = gets.chomp.upcase.split(" ")
    until @player.board.valid_coordinate?(entry_2[0]) == true && @player.board.valid_coordinate?(entry_2[1]) == true && @player.board.valid_placement?(player_sub, entry_2)
      puts "Those are invalid coordinates. Please try again:"
      puts ">"
      entry_2 = gets.chomp.upcase.split(" ")
    end
    @player.board.place(player_sub, entry_2)
    turn
  end

  def turn
    until computer.has_lost? == true || (@player_cruiser.health == 0 && @player_sub.health == 0)
      p "=============COMPUTER BOARD============="
      computer.board.render
      p "==============PLAYER BOARD=============="
      player.board.render(true)
      player_shot_process
      computer_shot_process
    end
    if computer.has_lost? == true
      p "You won!"
    elsif @player_cruiser.health == 0 && @player_sub.health == 0
      p "I won!"
    end
  end

  def player_shot_process
      p "Enter the coordinate for your shot:"
      p ">"
      shot_entry = gets.chomp.upcase
    until @player.board.valid_coordinate?(shot_entry) == true
      p "Please enter a valid coordinate:"
      p ">"
      shot_entry = gets.chomp.upcase
    end
    computer.board.grid[shot_entry].fire_upon
    # require "pry"; binding.pry
  end

  def computer_shot_process
    possible_shots =
      player.board.grid.keys.find_all do |cell|
        player.board.grid[cell].impacted == false
      end
    coord = possible_shots.shuffle.first
    player.board.grid[coord].fire_upon
  end
end
