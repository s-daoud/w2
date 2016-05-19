require_relative 'player'
require_relative 'hand'
require_relative 'deck'
require_relative 'card'
class Poker
  attr_accessor :total_points, :deck, :current_player, :current_player_index, :folded
  def initialize(players)
    @total_pot = 0
    @players = players
    @deck = Deck.new
    start_deal
    @current_player_index = 0
    @current_player = @players[@current_player_index]
  end

  def deal
    @deck.deal
  end

  def higher_hand


  end

  def start_deal
    @deck.cards.shuffle!
    @players.each do |player|
      player.hand = []
      5.times do
        player.hand << deal
      end
    end
  end

  def play
    until over?
      start_deal
      play_round
      highest = {}
      @players.each do |player|
        puts player.hand
        highest[player] = player.hand.get_hand_value
      end
      winning_player = highest.sort_by { |k, v| v }[-1][0]
      #if hand values are the same
      #sends player hands to higher_hand
      #checks each hand for highest card
      winning_player.pot += @total_pot
      @total_pot = 0
      @players.delete_if do |player|
        player.pot == 0
      end
    end
    puts "#{@players[0].name} wins!"
  end

  def play_round
    @folded = []
    previous_folded = nil
    until previous_folded == @folded
      previous_folded = @folded.dup
      @total_pot += @current_player.bet
      if @current_player.see?
        puts @total_pot
      end
      puts "Would you like to fold or raise."
      user_input = gets.chomp
      if user_input == "fold"
        @folded << @current_player
      else
        @total_pot += @current_player.bet
      end
      puts @current_player.hand
      @current_player.discard.times do
        @current_player.hand << @deck.deal
      end
      switch_turn
    end
  end

  def turn_over?

  end

  def switch_turn
    @current_player_index += 1
    @current_player_index %= @players.length
    @current_player = @players[@current_player_index]
    if @folded.include?(@current_player)
      switch_turn
    end
  end

  def over?
    @players.length == 1
  end

end
