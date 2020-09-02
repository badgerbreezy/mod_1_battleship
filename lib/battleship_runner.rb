require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/gameplay'
require './lib/player'
require './lib/messages'

battleship = Gameplay.new(@computer, @player)
battleship.menu
