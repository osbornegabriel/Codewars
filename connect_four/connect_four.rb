def who_is_winner(pieces_position_list)
  board = Connect_Four.new
  board.play_game(pieces_position_list)
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
    check_diagonal
  end

  def check_lines(lines)
    lines.each{|line| check_line(line)}
  end

  def check_diagonal
    check_lines(first_column_start + two_to_four_column_start + four_to_six_column_start + last_column_start)
  end

  def rev_construct_diagonal(column_i,row_i)
    columns = @board.values.reverse
    diagonal = []
    until row_i > 5 || column_i > 6
      diagonal << columns[column_i][row_i]
      column_i += 1
      row_i += 1
    end
    diagonal
  end

  def construct_diagonal(column_i,row_i)
    columns = @board.values
    diagonal = []
    until row_i > 5 || column_i > 6
      diagonal << columns[column_i][row_i]
      column_i += 1
      row_i += 1
    end
    diagonal
  end

  def first_column_start
    [
      construct_diagonal(0,0),
      construct_diagonal(0,1),
      construct_diagonal(0,2)
    ]
  end

  def two_to_four_column_start
    [
      construct_diagonal(1,0),
      construct_diagonal(2,0),
      construct_diagonal(3,0)
    ]
  end

  def four_to_six_column_start
    [
      rev_construct_diagonal(1,0),
      rev_construct_diagonal(2,0),
      rev_construct_diagonal(3,0)
    ]
  end

  def last_column_start
    [
      rev_construct_diagonal(0,0),
      rev_construct_diagonal(0,1),
      rev_construct_diagonal(0,2)
    ]
  end

  def check_columns
    check_lines(@board)
  end

  def check_rows
    check_lines(rows)
  end

  def check_line(line)
    four = line.join.scan(/(Red|Yellow)\1{3}/)
    @game_over = true if !!four[0]
    @winner = four[0][0] if four[0] && !@winner
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