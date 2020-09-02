class Gameplay
  attr_reader :computer, :player, :player_cruiser, :player_sub
  def initialize(computer, player)
    @computer = computer
    @player = player
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
  end

  def menu
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit."
  ">"
  reply = gets.chomp.downcase
    if reply == 'p'
      set_up
    elsif reply == 'q'
      exit
    else
      menu
    end
  end

  def set_up
    @computer.ship_placement_random(@computer_cruiser)
    @computer.ship_placement_random(@computer_submarine)
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    @computer.board.render
    @player.board.render
    puts "Enter the squares for the Cruiser (3 spaces):"
    puts ">"
    entry_1 = gets.chomp.upcase.split(" ")

    until @player.board.valid_coordinate?(entry_1[0]) == true && @player.board.valid_coordinate?(entry_1[1]) == true && @player.board.valid_coordinate?(entry_1[2]) && @player.board.valid_placement?(player_cruiser, entry_1)
      puts "Those are invalid coordinates. Please try again:"
      puts ">"
      entry_1 = gets.chomp.upcase.split(" ")
    end
    @player.board.place(player_cruiser, entry_1)
    puts "Enter the squares for the Submarine (2 spaces)"
    puts ">"
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
    until computer.has_lost? == true || player.has_lost? == true
      #require 'Pry';binding.pry
      puts "=============COMPUTER BOARD============="
      computer.board.render
      puts "==============PLAYER BOARD=============="
      player.board.render(true)
      player_shot_process
      if computer.has_lost? == true
        break
      end
      computer_shot_process
    end
    if computer.has_lost? == true
      puts "You won!"
    elsif player.has_lost? == true
      puts "I won!"
    end
    menu
  end

  def player_shot_process
    puts "Enter the coordinate for your shot:"
    puts ">"
    shot_entry = gets.chomp.upcase
      until @computer.board.valid_coordinate?(shot_entry) == true
        puts "Please enter a valid coordinate:"
        puts ">"
        shot_entry = gets.chomp.upcase
      end
      if @computer.board.grid[shot_entry].impacted == true
        puts "You've already fired a shot at that coordinate."
        player_shot_process
      end
    computer.board.grid[shot_entry].fire_upon
    if computer.board.grid[shot_entry].render == "M"
      puts "Your shot on #{shot_entry} was a miss."
    elsif computer.board.grid[shot_entry].render == "H"
      puts "Your shot on #{shot_entry} was a hit."
    elsif computer.board.grid[shot_entry].render == "X"
      puts "Your shot on #{shot_entry} sunk a ship."
    end
  end

  def computer_shot_process
    possible_shots =
      player.board.grid.keys.find_all do |cell|
        player.board.grid[cell].impacted == false
      end
    coord = possible_shots.shuffle.first
    player.board.grid[coord].fire_upon
    if player.board.grid[coord].render == "M"
      puts "My shot on #{coord} was a miss."
    elsif player.board.grid[coord].render == "H"
      puts "My shot on #{coord} was a hit."
    elsif player.board.grid[coord].render == "X"
      puts "My shot on #{coord} sunk a ship."
    end
  end
end
