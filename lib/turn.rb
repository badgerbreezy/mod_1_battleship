def Turn


def render(answer = false)
  column_range = 1..4
  row_range = "A".."D"
  board_rows = []

  if answer == "display"
    top_row ="=============COMPUTER BOARD=============\n" + "  " + "1 2 3 4" + " \n"

  else
    top_row ="==============PLAYER BOARD==============\n" + "  " + "1 2 3 4" + " \n"
  else
    top_row ="  " + "1 2 3 4" + " \n"
  end

  row_range.each do |row|
    row_string = row + " "
    # ["A ", "B ","C ","D "]
    column_range.each do |column|
      cell_coordinate = row + column.to_s
      # ["A1", "A2",..."D4"]
      row_string += @grid[cell_coordinate].render(answer) + " "
      # ["A . .  .  . \n", "B . . . . \n"","C . . . \n,"D . . . .\n"]
    end
    board_rows << row_string + "\n"
  end
  puts top_row + board_rows.join
end
