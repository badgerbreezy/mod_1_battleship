require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/gameplay'
require './lib/player'
require './lib/messages'
runner_board = Board.new
computer_board = Board.new
computer = Computer.new(computer_board)
player_board = Board.new
player = Player.new(player_board)
battleship = Gameplay.new(computer, player)# require "pry"; binding.pry
# player_cruiser = Ship.new("cruiser", 3 )

# sub_keys = []
# computer = Board.new
# cruiser = Ship.new("cruiser", 3)


battleship.menu
# p "Enter p to play. Enter q to quit."
# reply = gets.chomp.downcase
# if reply == p
#   game.play
# elsif reply == q
#   game.quit
# end

# until computer.has_lost? == true || player_1.has_lost? == true
#   p "=============COMPUTER BOARD============="
#   computer.board.render
#   p "==============PLAYER BOARD=============="
#   player.board.render
#   shot_process
#   p "Enter the coordinate for your shot:"
#   ">"
#   shot_entry = gets.chomp.upcase.to_a
#   if board.valid_coordinate(shot_entry)
#     take_shot
#   else
#     "Please enter a valid coordinate:"
#   p  ">"









# board.render("display")
