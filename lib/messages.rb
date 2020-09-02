require 'colorize'
require 'colorized_string'
class Messages

  def self.render_art_win
    File.readlines("battleship.txt") do |line|
      puts line
    end
  end

  def self.render_art_lose
    File.readlines("battleship_2.txt") do |line|
      puts line
    end
  end

  def self.menu
    puts "     ░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗".colorize(:color => :blue)
    puts "     ░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝".colorize(:color => :blue)
    puts "     ░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░".colorize(:color => :blue)
    puts "     ░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░".colorize(:color => :blue)
    puts "     ░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗".colorize(:color => :blue)
    puts "     ░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝".colorize(:color => :blue)
    puts " "
    sleep(2)
    puts "                                ▀█▀ █▀█".colorize(:blue)
    puts "                                ░█░ █▄█".colorize(:blue)
    puts " "
    sleep(2)
    puts "██████╗░░█████╗░████████╗████████╗██╗░░░░░███████╗░██████╗██╗░░██╗██╗██████╗░".colorize(:blue)
    puts "██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║░░░░░██╔════╝██╔════╝██║░░██║██║██╔══██╗".colorize(:blue)
    puts "██████╦╝███████║░░░██║░░░░░░██║░░░██║░░░░░█████╗░░╚█████╗░███████║██║██████╔╝".colorize(:blue)
    puts "██╔══██╗██╔══██║░░░██║░░░░░░██║░░░██║░░░░░██╔══╝░░░╚═══██╗██╔══██║██║██╔═══╝░".colorize(:blue)
    puts "██████╦╝██║░░██║░░░██║░░░░░░██║░░░███████╗███████╗██████╔╝██║░░██║██║██║░░░░░".colorize(:blue)
    puts "╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░░░░╚═╝░░░╚══════╝╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░".colorize(:blue)
    puts " "
    sleep(2)
    puts "---------------------Created by Todd Estes and Brian Liu---------------------"
    sleep(2)
    puts " "
    puts "█▀▀ █▄░█ ▀█▀ █▀▀ █▀█   █▀█   ▀█▀ █▀█   █▀█ █░░ ▄▀█ █▄█ ░   █▀▀ █▄░█ ▀█▀ █▀▀ █▀█   █▀█   ▀█▀ █▀█   █▀█ █░█ █ ▀█▀ ░"
    puts "██▄ █░▀█ ░█░ ██▄ █▀▄   █▀▀   ░█░ █▄█   █▀▀ █▄▄ █▀█ ░█░ ▄   ██▄ █░▀█ ░█░ ██▄ █▀▄   ▀▀█   ░█░ █▄█   ▀▀█ █▄█ █ ░█░ ▄"
    puts ">>>"
  end

  def self.setup1
    puts "."
    sleep(1)
    puts ".."
    sleep(1)
    puts "..."
    sleep(1)
    puts "I have laid out my ships on the grid.\n"
    sleep(1)
    puts "You now need to lay out your two ships.\n"
    sleep(1)
    puts "The Cruiser is three units long and the Submarine is two units long.\n"
  end

  def self.invalid_coordinates
    puts "Those are invalid coordinates. Please try again:"
    puts ">"
  end

  def self.player_won
    puts "██╗░░░██╗░█████╗░██╗░░░██╗  ░██╗░░░░░░░██╗░█████╗░███╗░░██╗  ██╗██╗██╗".colorize(:red)
    puts "╚██╗░██╔╝██╔══██╗██║░░░██║  ░██║░░██╗░░██║██╔══██╗████╗░██║  ██║██║██║".colorize(:red)
    puts "░╚████╔╝░██║░░██║██║░░░██║  ░╚██╗████╗██╔╝██║░░██║██╔██╗██║  ██║██║██║".colorize(:red)
    puts "░░╚██╔╝░░██║░░██║██║░░░██║  ░░████╔═████║░██║░░██║██║╚████║  ╚═╝╚═╝╚═╝".colorize(:red)
    puts "░░░██║░░░╚█████╔╝╚██████╔╝  ░░╚██╔╝░╚██╔╝░╚█████╔╝██║░╚███║  ██╗██╗██╗".colorize(:red)
    puts "░░░╚═╝░░░░╚════╝░░╚═════╝░  ░░░╚═╝░░░╚═╝░░░╚════╝░╚═╝░░╚══╝  ╚═╝╚═╝╚═╝".colorize(:red)
    puts " "
    sleep(3)
    puts render_art_win
    puts " "
    puts "===================================================================="
    puts " "
    sleep(5)
    puts "Returning to menu in:"
    puts "5"
    sleep(1)
    puts "4"
    sleep(1)
    puts "3"
    sleep(1)
    puts "2"
    sleep(1)
    puts "1"
    sleep(1)
  end

  def self.compuer_won
    puts "█▄█ █▀█ █░█ █▀█   █▀▀ █░░ █▀▀ █▀▀ ▀█▀   █░█ ▄▀█ █▀   █▄▄ █▀▀ █▀▀ █▄░█   █▀▄ █▀▀ █▀ ▀█▀ █▀█ █▀█ █▄█ █▀▀ █▀▄   ▀ ▄▀"
    puts "░█░ █▄█ █▄█ █▀▄   █▀░ █▄▄ ██▄ ██▄ ░█░   █▀█ █▀█ ▄█   █▄█ ██▄ ██▄ █░▀█   █▄▀ ██▄ ▄█ ░█░ █▀▄ █▄█ ░█░ ██▄ █▄▀   ▄ ▀▄"
    puts render_art_lose
  end
end
