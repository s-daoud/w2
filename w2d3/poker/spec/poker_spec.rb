require "rspec"
require "card"
require "deck"
require "player"
require "hand"

describe Card do
  subject(:card) { Card.new(14, :s) }
  describe "#initialize" do
    it "should give a card a value" do
      expect(card.value).to eq(14)
    end

    it "should give a card a suit" do
      expect(card.suit).to eq(:s)
    end
  end
end

describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "should initialize an array" do
      expect(deck.cards.length).to eq(52)
    end
  end

  describe "#populate" do
    it "shuffles the deck" do
      expect(deck.cards).to_not eq(deck.cards.shuffle)
    end

    it "correctly populates the deck" do
      expect(deck.cards).to_not include(nil)
    end

    it "shouldn't have multiple copies of the same card" do
      expect(deck.cards.uniq.length).to eq(52)
    end
  end
end

describe Player do
  subject(:player) { Player.new("Bob", Hand.new, 50)}
  describe "#initialize" do
    it "correctly names the player" do
      expect(player.name).to eq("Bob")
    end
    #
    # it "gives the player 5 cards" do
    #   expect(player.hand.length).to eq(5)
    # end

    it "gives the player a pot" do
      expect(player.pot).to eq(50)
    end
  end
end

describe Hand do
  subject(:hand) { Hand.new }
  describe "#initialize" do
    it "initializes with an empty array" do
      expect(hand.cards).to eq([])
    end
  end

  describe "#get_hand_value" do
    let(:card1) { double("card1", :value => 14, :suit => :s) }
    let(:card2) { double("card2", :value => 13, :suit => :s) }
    let(:card3) { double("card3", :value => 12, :suit => :s) }
    let(:card4) { double("card4", :value => 11, :suit => :s) }
    let(:card5) { double("card5", :value => 10, :suit => :s) }
    it "correctly gives the player's hand a value" do
      hand.cards = [card1, card2, card3, card4, card5]
      expect(hand.get_hand_value).to eq(10)
    end
  end

  describe "card values" do
    it "knows when it's a royal flush" do
      hand.cards = [card1, card2, card3, card4, card5]
      expect(hand.royal_flush?).to be true
    end
  end
end
