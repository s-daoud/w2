require "colorize"
require_relative "cursor"

class Display

  include Cursorable
  attr_accessor :cursor, :selected, :board

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @selected = false
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j, piece)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j, piece)
    if piece.color == :white
      col = :white
    elsif piece.color == :black
      col = :black
    end
    if [i, j] == @cursor_pos && !@selected
      bg = :light_red
    elsif [i, j] == @cursor_pos && @selected
      bg = :red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: col }
  end

  def render
    system("clear")
    # puts "#{@board.@current_player.color}'s turn"
    puts "Arrow keys to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
  end

end
