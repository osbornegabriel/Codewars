def who_is_winner(pieces_position_list)
  #le code
end

class Connect_Four
  attr_accessor :board, :winner

  def initialize
    @board = create_board
    @game_over = false
    @winner = "Draw"
  end

  def create_board
    columns = ('A'..'G').to_a
    board = Hash.new
    columns.each {|column| board[column] = [''] * 6}
    board
  end

  def play_game(game_sequence)
    game_sequence.each do |move|
      drop_checker(move)
      check_board
      break if @game_over
    end
    @winner
  end

  def check_board
    check_columns
    check_rows
  end

  def check_lines(lines)
    lines.each{|line| check_line(line)}
  end

  def check_columns
    check_lines(@board)
  end

  def check_rows
    check_lines(rows)
  end

  def check_line(line)
    four = line.join.scan(/(Red|Yellow)\1{3}/)
    @game_over = !!four[0]
    @winner = four[0][0] if four[0]
  end

  def check_row(row_index)
    row = create_row(row_index)
    check_line(row)
  end

  def rows
    (0..5).to_a.map{|index| create_row(index)}
  end

  def create_row(row_index)
    @board.values.map{|column| column[row_index]}
  end

  def drop_checker(checker)
    column = checker[0]
    color = checker[2..-1]
    @board[column][@board[column].index('')] = color
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
p board.play_game(game)
board.winner
p board
# p board
# p board.create_row(0)
# p board.check_rows