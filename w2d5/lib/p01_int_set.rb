class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0,@store.length-1)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end

require "byebug"
class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num%num_buckets] << num  unless include?(num)
  end

  def remove(num)
    @store[num%num_buckets].delete(num) if include?(num)
  end

  def include?(num)
    @store[num%num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      resize! if @count == num_buckets
      @store[num%num_buckets] << num
      @count += 1
    end
  end

  def remove(num)
    @store[num%num_buckets].delete(num) if include?(num)
  end

  def include?(num)
    @store[num%num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = Array.new(2 * num_buckets) { Array.new }
    @store.each do |el|
      el.each do |n|
        temp_store[n % temp_store.length] << n
      end
    end
    @store = temp_store
  end
end
