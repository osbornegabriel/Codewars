# who_is_winner is the provided method name for challenge
def who_is_winner(pieces_position_list)
  board = Connect_Four.new
  board.play_game(pieces_position_list)
end

class Connect_Four
  attr_reader :board, :winner

  def initialize
    @board = create_board
    @game_over = false
    @winner = "Draw"
  end

  def create_board
    columns = ('A'..'G').to_a
    board = Hash.new
    columns.each {|column| board[column] = ['0'] * 6}
    board
  end

  def play_game(game_sequence)
    game_sequence.each do |move|
      drop_checker(move)
      check_board
      break if @game_over
    end
    visualize_gameboard
    @winner
  end

  def check_board
    check_lines(columns)
    check_lines(rows)
    check_lines(diagonals)
  end

  def drop_checker(checker)
    column = checker[0]
    color = checker[2..-1]
    @board[column][@board[column].index('0')] = color
  end

  def check_lines(lines)
    lines.each{|line| check_line(line); break if @game_over}
  end

  def check_line(line)
    four = line.join.scan(/(Red|Yellow)\1{3}/)
    @game_over = true if !!four[0]
    @winner = four[0][0] if four[0]
  end

  def columns
    @board.values
  end

  def rows
    @board.values.transpose
  end

  def diagonals
    edges_diagonals + center_diagonals
  end

  def edges_diagonals
    diagonals = Array.new
    3.times do |i|
      diagonals << construct_diagonal(0,i)
      diagonals << rev_construct_diagonal(0,i)
    end
    diagonals
  end

  def center_diagonals
    diagonals = Array.new
    3.times do |i|
      diagonals << construct_diagonal(i + 1,0)
      diagonals << rev_construct_diagonal(i + 1,0)
    end
    diagonals
  end

  def rev_construct_diagonal(column_i,row_i)
    rev_columns = @board.values.reverse
    diagonal_seq(column_i,row_i,rev_columns)
  end

  def construct_diagonal(column_i,row_i)
    columns = @board.values
    diagonal_seq(column_i,row_i,columns)
  end

  def diagonal_seq(column_i,row_i,board)
    diagonal = []
    until row_i > 5 || column_i > 6
      diagonal << board[column_i][row_i]
      column_i += 1
      row_i += 1
    end
    diagonal
  end

  #Fun visualization tool
  def visualize_gameboard
    visual = @board.values.transpose.reverse
    visual.map!{|row| filter_first_letter(row)}
    visual.each{|row| p row.join}
  end

  def filter_first_letter(a)
    a.map!{|word| word[0] || 0}
  end
end