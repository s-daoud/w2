require_relative "board.rb"
require_relative "humanplayer.rb"

class Chess

  attr_accessor :player_1, :player_2, :board, :current_player

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @board = Board.new
    @current_player = @player_1
    @display = Display.new(@board)
  end

  def play
    #cursor functionality
    @player_1.display = @display
    @player_2.display = @display
    until won?
      render
      puts "#{@current_player.color}'s turn"
      puts "You're in check!" if check?
      while true
        input = @current_player.get_input
        unless @board.grid[input[0][0]][input[0][1]].color == @current_player.color
          puts "Can't move opponent's pieces"
          next
        end
        next_board = @board.dup_board
        next_board.move(input[0], input[1])
        not_checked = !next_board.in_check?(@current_player.color)
        if @board.valid_move?(input[0], input[1]) && not_checked
          break
        else
          puts "Not a valid move, try again"
        end
      end
      @board.move(input[0], input[1])
      switch_players
    end
    switch_players
    render
    puts "#{@current_player.name} wins!"
  end

  def render
    @display.render
  end

  def check?
    @board.in_check?(@current_player.color)
  end

  def won?
    @board.checkmate?(@current_player.color)
  end

  def switch_players
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Chess.new(HumanPlayer.new("a", :white), HumanPlayer.new("b", :black))
  game.play
end
