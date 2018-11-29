def who_is_winner(pieces_position_list)
  #le code
end

class Connect_Four
  attr_accessor :board

  def initialize
    @board = create_board
    @game_over = false
  end

  def create_board
    columns = ('A'..'G').to_a
    board = Hash.new
    columns.each {|column| board[column] = [''] * 6}
    board
  end

  def check_columns
    @board.each{|column| check_line(column)}
  end

  def check_rows
    rows = create_rows
    rows.each{|row| check_line(row)}
  end

  def check_line(line)
    four = line.join.scan(/R{4}/)
    @game_over = four
  end

  def check_row(row_index)
    row = create_row(row_index)
    check_line(row)
  end

  def create_rows
    (0..5).to_a.map{|index| create_row(index)}
  end

  def create_row(row_index)
    @board.values.map{|column| column[row_index]}
  end

  def drop_checker(checker)
    column = checker[0]
    color = checker[2]
    @board[column][@board[column].index('')] = color
  end

  def play_checkers(moves)
    moves.each{|move| drop_checker(move)}
  end

end

p board = Connect_Four.new
# board.drop_checker("A_Red")
# p board.board
game =   ["A_Red",
  "B_Yellow",
  "A_Red",
  "B_Yellow",
  "A_Red",
  "B_Yellow",
  "G_Red",
  "B_Yellow"]
board.play_checkers(game)
p board
p board.create_row(0)
p board.create_rows