p "Welcome to BATTLESHIP"
p "Enter p to play. Enter q to quit."
reply = gets.chomp.downcase
if reply == p
  game.play
elsif reply == q
  game.quit
end

board.render("display")
