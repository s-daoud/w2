require "byebug"
require "colorize"

class Piece
  attr_accessor :board, :pos, :color, :move_count

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
    @kill_count = 0
    @move_count = 0
  end

  def move(end_pos)
    # debugger
    self.pos = end_pos
    self.move_count += 1
  end

  def move_valid?(end_pos)
    end_pos.first.between?(0, 7) && end_pos.last.between?(0, 7) &&
    @board[end_pos].color != self.color
  end

  def dup(dupped_board)
    self.class.new(dupped_board, @pos, @color)
  end

end

class SlidingPiece < Piece
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def diagonals
    arr = []
    arr += directions(1,1)
    arr += directions(1,-1)
    arr += directions(-1,1)
    arr += directions(-1,-1)
    arr
  end

  def straights
    arr = []
    arr += directions(1, 0)
    arr += directions(0, 1)
    arr += directions(-1, 0)
    arr += directions(0, -1)
    arr
  end

  def directions(i,j)
    arr = []
    x, y = @pos
    1.upto(8) do |idx|
      arr << [x + idx*i, y + idx*j]
      break unless (x + idx * i).between?(0, 7) && (y + idx * j).between?(0, 7)
      break unless @board.grid[x + idx*i][y + idx*j].is_a?(NullPiece)
    end
    arr.select{ |el| move_valid?(el)}
  end

end

class SteppingPiece < Piece
  def initialize(board, pos, color)
    super(board, pos, color)
  end

end

class Pawn < Piece
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def moves
    x, y = @pos
    result = []
    if @color == :black
      result << [x+1,y] if @board.grid[x + 1][y].is_a?(NullPiece)
      result << [x+2,y] if @board.grid[x + 2][y].is_a?(NullPiece) && @move_count == 0
      result << [x+1,y-1] if @board.grid[x + 1][y - 1].color != self.color && !@board.grid[x + 1][y - 1].is_a?(NullPiece)
      result << [x+1,y+1] if @board.grid[x + 1][y + 1].color != self.color && !@board.grid[x + 1][y + 1].is_a?(NullPiece)
    else
      result << [x-1,y] if @board.grid[x - 1][y].is_a?(NullPiece)
      result << [x-2,y] if @board.grid[x - 2][y].is_a?(NullPiece) && @move_count == 0
      result << [x-1,y-1] if @board.grid[x - 1][y - 1].color != self.color && !@board.grid[x - 1][y - 1].is_a?(NullPiece)
      result << [x-1,y+1] if @board.grid[x - 1][y + 1].color != self.color && !@board.grid[x - 1][y + 1].is_a?(NullPiece)
    end
    result.select{|el| move_valid?(el)}
  end

  def to_s
    " \u265F "
  end
end

class King < SteppingPiece
  def initialize(board, pos, color)
    super(board, pos, color)
    if color == :white
      board.white_king = self
    else
      board.black_king = self
    end
  end

  def moves
    king_moves = [[-1, -1], [-1, 0], [-1, 1], [0, 1],
                  [0, -1], [1, 1], [1, 0], [1, -1]]
    possible_moves = king_moves.map do |move|
      [move.first + @pos.first, move.last + @pos.last]
    end
    possible_moves.select { |el| move_valid?(el) }
  end

  def to_s
    " \u265A "
  end
end

class Knight < SteppingPiece
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def moves
    knight_moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2],
                    [1, -2], [1, 2], [2, -1], [2, 1]]
    possible_moves = knight_moves.map do |move|
      [move.first + @pos.first, move.last + @pos.last]
    end
    possible_moves.select { |el| move_valid?(el) }
  end

  def to_s
    " \u265E "
  end
end

class Queen < SlidingPiece
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def moves
    possible_moves = diagonals + straights
    possible_moves.select { |el| move_valid?(el) }
  end

  def to_s
    " \u265B "
  end
end

class Rook < SlidingPiece
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def moves
    possible_moves = straights
    possible_moves.select { |el| move_valid?(el) }
  end

  def to_s
    " \u265C "
  end
end

class Bishop < SlidingPiece
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def moves
    possible_moves = diagonals
    possible_moves.select { |el| move_valid?(el) }
  end

  def to_s
    " \u265D "
  end
end

class NullPiece < Piece
  def initialize(board, pos, color = nil)
    super(board, pos, color)
  end

  def moves
    []
  end

  def to_s
    "   "
  end
end

class NilClass
  def color
    nil
  end
  def moves
    []
  end
end
