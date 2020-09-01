class Gameplay
  attr_reader :computer, :player
  def initialize(computer, player)
    @computer = computer
    @player = player
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
    player_cruiser = Ship.new("cruiser", 3 )
    @player.board.place(player_cruiser, entry_1)
    player_sub = Ship.new("submarine", 2 )
    p "Enter the squares for the Submarine (2 spaces)"
    p ">"
    entry_2 = gets.chomp.upcase.split(" ")
    until @player.board.valid_coordinate?(entry_2[0]) == true && @player.board.valid_coordinate?(entry_2[1]) == true && @player.board.valid_placement?(player_sub, entry_2)
      puts "Those are invalid coordinates. Please try again:"
      puts ">"
      entry_2 = gets.chomp.upcase.split(" ")
    end
    @player.board.place(player_sub, entry_2)
    require "pry"; binding.pry
    turn
  end

  def turn
    until computer.has_lost? == true || player_1.has_lost? == true
      p "=============COMPUTER BOARD============="
      computer.board.render
      p "==============PLAYER BOARD=============="
      player.board.render(true)
      require "pry"; binding.pry
      player_shot_process
      computer_shot_process
    end
  end

  def shot_process
    until valid_coordinate(shot_entry) == true
      p "Enter the coordinate for your shot:"
      ">"
      shot_entry = gets.chomp.upcase.to_a
    if board.valid_coordinate(shot_entry)
      take_shot
    else
      p "Please enter a valid coordinate:"
      p ">"
    end
  end

  def computer_shot_process
    until player.board.computer_shot
      computer_shot = player.board.grid.sample(1)
    end
  end
end


#class Turn
#
    #def initialize(player_board, computer_board)
      #@player_board = player_board
      #@computer_board = computer_board
    #end
#
#
  #def game_setup
    #cruiser = Ship.new("Cruiser", 3)
    #destroyer = Ship.new("Destroyer", 4)
    #submarine = Ship.new("Submarine", 2)
    #board = Board.new
  #end
#
#
  #def game_setup
    #board.place(cruiser, ["A1", "A2", "A3"])
    #board.place(submarine, ["C1", "C2"])
#
  #end
#
#
#
  ##def render(answer = false)
    ##column_range = 1..4
    ##row_range = "A".."D"
    ##board_rows = []
  ##end
  #def game_setup
#
  #end


  #if answer == "display"
    #top_row ="=============COMPUTER BOARD=============\n" + "  " + "1 2 3 4" +  " \n"
#
  #elsif
    #top_row ="==============PLAYER BOARD==============\n" + "  " + "1 2 3 4" +  " \n"
  #else
    #top_row ="  " + "1 2 3 4" + " \n"
  #end

  #row_range.each do |row|
    #row_string = row + " "
    ## ["A ", "B ","C ","D "]
    #column_range.each do |column|
      #cell_coordinate = row + column.to_s
      ## ["A1", "A2",..."D4"]
      #row_string += @grid[cell_coordinate].render(answer) + " "
      ## ["A . .  .  . \n", "B . . . . \n"","C . . . \n,"D . . . .\n"]
    #end
    #board_rows << row_string + "\n"
  #end
  #puts top_row + board_rows.join
end


def computer_shot_process
  if possible_shots = 
