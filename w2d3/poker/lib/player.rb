require_relative "deck"
class Player
  attr_accessor :name, :hand, :pot

  def initialize(name)
    @name = name
    @hand = []
    @pot = 50
  end

  def bet
    puts "How much would you like to bet?"
    user_bet = Integer(gets.chomp)
    self.pot -= user_bet
    user_bet
  end
  #
  # def fold?
  #   puts "Would you like to fold your hand?"
  #   user_input = gets.chomp
  #   user_input == "yes" ? true : false
  # end

  def see?
    puts "Would you like to see the current pot?"
    user_input = gets.chomp
    user_input == "yes" ? true : false
  end

  # def raise?
  #   puts "Would you like to raise?"
  #   user_input = gets.chomp
  #   user_input == "yes" ? true : false
  # end

  def how_much_raise
    puts "How much would you like to raise?"
    user_input = Integer(gets.chomp)
  end

  def discard
    puts "How many cards would you like to discard?"
    user_input = Integer(gets.chomp)
    user_input.times do
      @hand.each do |el|
        print "#{el.to_s} "
      end
      puts "Which cards would you like to discard?"
      user_card = Integer(gets.chomp)
      @hand.delete(user_card)
    end
    user_input
  end
end
