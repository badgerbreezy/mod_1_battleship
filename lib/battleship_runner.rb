require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'

p "Welcome to BATTLESHIP"
#p "Enter p to play. Enter q to quit."
#
#reply = gets.chomp.downcase
#if reply == 'p'
  #puts "Get ready to play!"
#elsif reply == 'q'
  #puts "Goodbye."
#else
  #loop do
    #puts "That is not a valid input. Try again."
    #answer = gets.chomp.downcase
    #if answer == 'y'
      #break
    #end
  #end
#end

turn = Turn.new

#board.render("display")
