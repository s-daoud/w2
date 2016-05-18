require_relative "display.rb"
require_relative "piece.rb"
require_relative "cursor.rb"
require "byebug"

class Board

  attr_accessor :grid, :black_king, :white_king

  def initialize
    @grid = starting_board
  end

  # def starting_board
  #   arr = []
  #   @black_king = King.new(self, [0, 4], :black)
  #   @white_king = King.new(self, [7, 4], :white)
  #   arr << [Rook.new(self, [0, 0], :black),
  #           Knight.new(self, [0, 1], :black),
  #           Bishop.new(self, [0, 2], :black),
  #           Queen.new(self, [0, 3], :black),
  #           @black_king,
  #           Bishop.new(self, [0, 5], :black),
  #           Knight.new(self, [0, 6], :black),
  #           Rook.new(self, [0, 7], :black)]
  #   arr << [NullPiece.new(self, [1, 0]),
  #           NullPiece.new(self, [1, 1]),
  #           NullPiece.new(self, [1, 2]),
  #           NullPiece.new(self, [1, 3]),
  #           NullPiece.new(self, [1, 4]),
  #           NullPiece.new(self, [1, 5]),
  #           NullPiece.new(self, [1, 6]),
  #           NullPiece.new(self, [1, 7])]
  #   arr << [NullPiece.new(self, [2, 0]),
  #           NullPiece.new(self, [2, 1]),
  #           NullPiece.new(self, [2, 2]),
  #           NullPiece.new(self, [2, 3]),
  #           NullPiece.new(self, [2, 4]),
  #           NullPiece.new(self, [2, 5]),
  #           NullPiece.new(self, [2, 6]),
  #           NullPiece.new(self, [2, 7])]
  #   arr << [NullPiece.new(self, [3, 0]),
  #           NullPiece.new(self, [3, 1]),
  #           NullPiece.new(self, [3, 2]),
  #           NullPiece.new(self, [3, 3]),
  #           NullPiece.new(self, [3, 4]),
  #           NullPiece.new(self, [3, 5]),
  #           NullPiece.new(self, [3, 6]),
  #           NullPiece.new(self, [3, 7])]
  #   arr << [NullPiece.new(self, [4, 0]),
  #           NullPiece.new(self, [4, 1]),
  #           NullPiece.new(self, [4, 2]),
  #           NullPiece.new(self, [4, 3]),
  #           NullPiece.new(self, [4, 4]),
  #           NullPiece.new(self, [4, 5]),
  #           NullPiece.new(self, [4, 6]),
  #           NullPiece.new(self, [4, 7])]
  #   arr << [NullPiece.new(self, [5, 0]),
  #           NullPiece.new(self, [5, 1]),
  #           NullPiece.new(self, [5, 2]),
  #           NullPiece.new(self, [5, 3]),
  #           NullPiece.new(self, [5, 4]),
  #           NullPiece.new(self, [5, 5]),
  #           NullPiece.new(self, [5, 6]),
  #           NullPiece.new(self, [5, 7])]
  #   arr << [NullPiece.new(self, [6, 0]),
  #           NullPiece.new(self, [6, 1]),
  #           NullPiece.new(self, [6, 2]),
  #           NullPiece.new(self, [6, 3]),
  #           NullPiece.new(self, [6, 4]),
  #           NullPiece.new(self, [6, 5]),
  #           NullPiece.new(self, [6, 6]),
  #           NullPiece.new(self, [6, 7])]
  #   arr << [Rook.new(self, [7, 0], :white),
  #           Knight.new(self, [7, 1], :white),
  #           Bishop.new(self, [7, 2], :white),
  #           Queen.new(self, [7, 3], :white),
  #           @white_king,
  #           Bishop.new(self, [7, 5], :white),
  #           Knight.new(self, [7, 6], :white),
  #           Rook.new(self, [7, 7], :white)]
  # end

  def starting_board
    arr = []
    @black_king = King.new(self, [0, 4], :black)
    @white_king = King.new(self, [7, 4], :white)
    arr << [Rook.new(self, [0, 0], :black),
            Knight.new(self, [0, 1], :black),
            Bishop.new(self, [0, 2], :black),
            Queen.new(self, [0, 3], :black),
            @black_king,
            Bishop.new(self, [0, 5], :black),
            Knight.new(self, [0, 6], :black),
            Rook.new(self, [0, 7], :black)]
    arr << [Pawn.new(self, [1, 0], :black),
            Pawn.new(self, [1, 1], :black),
            Pawn.new(self, [1, 2], :black),
            Pawn.new(self, [1, 3], :black),
            Pawn.new(self, [1, 4], :black),
            Pawn.new(self, [1, 5], :black),
            Pawn.new(self, [1, 6], :black),
            Pawn.new(self, [1, 7], :black)]
    arr << [NullPiece.new(self, [2, 0]),
            NullPiece.new(self, [2, 1]),
            NullPiece.new(self, [2, 2]),
            NullPiece.new(self, [2, 3]),
            NullPiece.new(self, [2, 4]),
            NullPiece.new(self, [2, 5]),
            NullPiece.new(self, [2, 6]),
            NullPiece.new(self, [2, 7])]
    arr << [NullPiece.new(self, [3, 0]),
            NullPiece.new(self, [3, 1]),
            NullPiece.new(self, [3, 2]),
            NullPiece.new(self, [3, 3]),
            NullPiece.new(self, [3, 4]),
            NullPiece.new(self, [3, 5]),
            NullPiece.new(self, [3, 6]),
            NullPiece.new(self, [3, 7])]
    arr << [NullPiece.new(self, [4, 0]),
            NullPiece.new(self, [4, 1]),
            NullPiece.new(self, [4, 2]),
            NullPiece.new(self, [4, 3]),
            NullPiece.new(self, [4, 4]),
            NullPiece.new(self, [4, 5]),
            NullPiece.new(self, [4, 6]),
            NullPiece.new(self, [4, 7])]
    arr << [NullPiece.new(self, [5, 0]),
            NullPiece.new(self, [5, 1]),
            NullPiece.new(self, [5, 2]),
            NullPiece.new(self, [5, 3]),
            NullPiece.new(self, [5, 4]),
            NullPiece.new(self, [5, 5]),
            NullPiece.new(self, [5, 6]),
            NullPiece.new(self, [5, 7])]
    arr << [Pawn.new(self, [6, 0], :white),
            Pawn.new(self, [6, 1], :white),
            Pawn.new(self, [6, 2], :white),
            Pawn.new(self, [6, 3], :white),
            Pawn.new(self, [6, 4], :white),
            Pawn.new(self, [6, 5], :white),
            Pawn.new(self, [6, 6], :white),
            Pawn.new(self, [6, 7], :white)]
    arr << [Rook.new(self, [7, 0], :white),
            Knight.new(self, [7, 1], :white),
            Bishop.new(self, [7, 2], :white),
            Queen.new(self, [7, 3], :white),
            @white_king,
            Bishop.new(self, [7, 5], :white),
            Knight.new(self, [7, 6], :white),
            Rook.new(self, [7, 7], :white)]
  end

  def move(start_pos, end_pos)
    self[start_pos].move(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new(self, start_pos)
  end

  def valid_move?(start_pos, end_pos)
    self[start_pos].moves.include?(end_pos)
  end

  def in_check?(our_color)
    result = []
    @grid.each do |row|
      row.each do |piece|
        result += piece.moves if piece.color != our_color
      end
    end
    # debugger
    if our_color == :black
      return true if result.include?(@black_king.pos)
    else
      return true if result.include?(@white_king.pos)
    end
    false
  end

  def checkmate?(our_color)
    all_pieces = []
    @grid.each do |row|
      row.each do |piece|
        all_pieces << piece if piece.color == our_color
      end
    end
    valid_moves = Hash.new
    all_pieces.each do |piece|
      valid_moves[piece] = piece.moves
    end
    all_possibles = []
    valid_moves.each do |piece, moves|
      moves.each do |each_move|
        new_board = dup_board
        new_board.move(piece.pos, each_move)
        all_possibles << new_board
      end
    end
    all_possibles.all? { |el| el.in_check?(our_color) } && in_check?(our_color)
  end

  def dup_board
    dupped_board = self.class.new
    result = []
    @grid.each do |el|
      subresult = []
      el.each {|subel| subresult << subel.dup(dupped_board)}
      result << subresult
    end
    dupped_board.grid = result
    dupped_board
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    x, y = pos
    @grid[x][y] = value
  end
end

class InvalidMoveError < StandardError
end

# [6, 5], [5, 5]
# [1, 4], [3, 4]
# [6, 6], [4, 6]
# [0, 3], [4, 7]
