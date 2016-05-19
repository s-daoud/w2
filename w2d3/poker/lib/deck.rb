class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    populate
  end

  def populate
    values = (2..14).to_a
    suits = [:s, :c, :d, :h]
    values.each do |value|
      suits.each do |suit|
        @cards << Card.new(value, suit)
      end
    end
    @cards.shuffle!
  end

  def deal
    @cards.shift
  end 
end
