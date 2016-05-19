require "rspec"
require "array_exercises"

describe Array do

  it "should have one instance of the elements in given order" do
    expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
  end

  it "should find index of two pairs that equal 0" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end

  it "should transpose given array" do
    rows = [[0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]]
    transposed = [[0, 3, 6],
                  [1, 4, 7],
                  [2, 5, 8]]
    expect(rows.my_transpose).to eq(transposed)
  end

  it "should return most profitable pair of days to buy and sell stocks" do
    stocks = [1000, 2000, 1500, 500, 3000]
    expect(stocks.most_profit).to eq([3, 4])
  end

end
