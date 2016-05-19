class TowersOfHanoi
  attr_accessor :board
  def initialize
    @board = [[1, 2, 3], [], []]
  end

  def move(start_pos, end_pos)
    if valid?(start_pos, end_pos)
      @board[end_pos].unshift(@board[start_pos].shift)
    else
      puts "Invalid move. Try again!"
    end
  end

  def valid?(start_pos, end_pos)
    @board[end_pos].empty? || @board[start_pos][0] < @board[end_pos][0]
  end

  def won?
    @board[1].length == 3 || @board[2].length == 3
  end

  def play
    until won?
      render
      puts "Please choose a start tower."
      start_pos = gets.chomp.to_i
      puts "Please choose a tower to move to."
      end_pos = gets.chomp.to_i
      move(start_pos, end_pos)
    end
    render
    puts "You won!"
  end

  def render
    # new_board = @board.transpose
    # new_board.each do |el|
    #   el.each do |pos|
    #     if pos.nil?
    #       print "   "
    #     else
    #       print " #{pos} "
    #     end
    #   end
    #   print "\n"
    # end
    p @board
  end


end

if __FILE__ == $PROGRAM_NAME
  TowersOfHanoi.new.play
end
