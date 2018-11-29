def who_is_winner(pieces_position_list)
  #le code
end

class Connect_Four
  attr_accessor :board

  def initialize
    @board = create_board
  end

  def create_board
    columns = ('A'..'G').to_a
    board = Hash.new
    columns.each {|column| board[column] = [''] * 6}
    board
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