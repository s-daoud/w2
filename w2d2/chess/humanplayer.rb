

class HumanPlayer

  attr_reader :name, :color
  attr_accessor :display

  def initialize(name, color)
    @name = name
    @color = color
    @display = nil
  end

  def get_input
    has_start = false
    start_pos = nil
    end_pos = nil
    until start_pos.is_a?(Array) && end_pos.is_a?(Array)
      @display.render
      puts "You're in check!" if @display.board.in_check?(@color)
      puts "#{@color}'s turn"
      maybe_pos = @display.get_input
      if maybe_pos.is_a?(Array) && !has_start
        start_pos = maybe_pos
        has_start = true
        maybe_pos = nil
      end
      if maybe_pos.is_a?(Array) && has_start
        end_pos = maybe_pos
        has_start = false
      end
    end
    p start_pos; p end_pos
    [start_pos, end_pos]
  end

end
