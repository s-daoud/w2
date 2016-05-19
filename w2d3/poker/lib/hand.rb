require_relative "card"
require "byebug"
class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def get_hand_value
    if royal_flush?
      10
    elsif straight_flush?
      9
    elsif four_of_a_kind?
      8
    elsif full_house?
      7
    elsif flush?
      6
    elsif straight?
      5
    elsif three_of_a_kind?
      4
    elsif two_pair?
      3
    elsif one_pair?
      2
    else
      1
    end
  end

  def royal_flush?
    sorted = @cards.sort_by { |card| card.value }
    player_hand = sorted.chunk_while { |x, y| x.value + 1 == y.value }.to_a
    @cards.all? { |card| @cards[0].suit == card.suit } && player_hand[0][-1].value == 14 && player_hand[0].length == @cards.length
  end

  def straight_flush?
    sorted = @cards.sort_by { |card| card.value }
    values = sorted[0..-2].map { |el| el.value }
    if sorted[-1].value == 14 && values == [2,3,4,5]
      return @cards.all? { |card| @cards[0].suit == card.suit }
    end
    player_hand = sorted.chunk_while { |x,y| x.value + 1 == y.value }.to_a
    @cards.all? { |card| @cards[0].suit == card.suit } && player_hand[0].length == @cards.length
  end

  def four_of_a_kind?
    # debugger
    values = []
    @cards.each { |card| values << card.value }
    selected = values.select { |el| values.count(el) == 4 }
    return false if selected.empty?
    true
  end

  def full_house?
    two_pair? && three_of_a_kind?
  end

  def flush?
    @cards.all? { |card| @cards[0].suit == card.suit }
  end

  def straight?
    sorted = @cards.sort_by { |card| card.value }
    values = sorted[0..-2].map { |el| el.value }
    return true if sorted[-1].value == 14 && values == [2,3,4,5]
    sorted.chunk_while { |x, y| x.value + 1 == y.value }.to_a[0].length == 5
  end

  def three_of_a_kind?
    values = []
    @cards.each { |card| values << card.value }
    selected = values.select { |el| values.count(el) == 3 }
    return false if selected.empty?
    true
  end

  def two_pair?
    values = []
    @cards.each { |card| values << card.value }
    selected = values.select { |el| values.count(el) >= 2 }
    return true if selected.length >= 4
    false
  end

  def one_pair?
    values = []
    @cards.each { |card| values << card.value }
    selected = values.select { |el| values.count(el) == 2 }
    return true if selected.length == 2
    false
  end

  def check_high_card
    sorted = @cards.sort_by { |card| card.value }
    sorted[-1].value
  end

end
