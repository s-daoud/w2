require "rspec"
require "towers_of_hanoi"

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }
  describe "#initialize" do
    it "should set up the game properly" do
      expect(game.board).to eq([[1, 2, 3],[],[]])
    end
  end

  describe "#won?" do
    it "should recognize when the game is won" do
      game.board = [[], [], [1, 2, 3]]
      expect(game.won?).to be true
      game.board = [[], [1, 2, 3], []]
      expect(game.won?).to be true
    end
  end

  describe "#move" do
    it "should move a piece" do
      game.move(0, 1)
      expect(game.board).to eq([[2,3], [1], []])
    end
    it "should check if a move is valid" do
      expect(game).to receive(:valid?).with(0, 1)
      game.move(0, 1)
    end
  end

  describe "#valid?" do
    it "allows moves to an empty space" do
      expect(game.valid?(0, 1)).to be true
    end
  end
end
