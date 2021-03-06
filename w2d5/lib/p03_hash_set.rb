require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      resize! if @count == num_buckets
      @store[key.hash%num_buckets] << key
      @count += 1
    end
  end

  def include?(key)
    @store[key.hash%num_buckets].include?(key)
  end

  def remove(key)
    @store[key.hash%num_buckets].delete(key) if include?(key)
  end

  private

  def [](num)
    @store[num.hash%num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = Array.new(2 * num_buckets) { Array.new }
    @store.each do |el|
      el.each do |n|
        temp_store[n.hash % temp_store.length] << n
      end
    end
    @store = temp_store
  end
end
