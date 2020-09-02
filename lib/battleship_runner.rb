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
battleship = Gameplay.new(computer, player)
battleship.menu
