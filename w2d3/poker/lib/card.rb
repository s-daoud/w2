class Card
  attr_reader :suit, :value
  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    if @suit == :s
      char = "\u2660"
    elsif @suit == :c
      char = "\u2663"
    elsif @suit == :d
      char = "\u2666"
    else
      char = "\u2665"
    end
    case @value
    when (2..10)
      "#{@value.to_s}#{char}"
    when 11
      "J#{char}"
    when 12
      "Q#{char}"
    when 13
      "K#{char}"
    when 14
      "A#{char}"
    end
  end
end
