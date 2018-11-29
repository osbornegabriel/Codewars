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

end

p Connect_Four.new.board