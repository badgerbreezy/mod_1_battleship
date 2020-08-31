require './lib/ship'
require './lib/cell'
require './lib/board'

class Turn

    def initialize(player_board, computer_board)
      @player_board = player_board
      @computer_board = computer_board
    end


  def game_setup
    cruiser = Ship.new("Cruiser", 3)
    destroyer = Ship.new("Destroyer", 4)
    submarine = Ship.new("Submarine", 2)
    board = Board.new
  end


  def game_setup
    board.place(cruiser, ["A1", "A2", "A3"])
    board.place(submarine, ["C1", "C2"])

  end



  #def render(answer = false)
    #column_range = 1..4
    #row_range = "A".."D"
    #board_rows = []
  #end
  def game_setup

  end


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
