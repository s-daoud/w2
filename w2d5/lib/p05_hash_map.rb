require_relative 'p02_hashing'
require_relative 'p04_linked_list'
require "byebug"

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[key.hash%num_buckets].include?(key)
  end

  def set(key, val)
    resize! if @count == num_buckets
    if @store[key.hash%num_buckets].include?(key)
      @store[key.hash%num_buckets].remove(key)
      @count -= 1
    end
    @store[key.hash%num_buckets].insert(key, val)
    @count += 1
  end

  def get(key)
    @store[key.hash%num_buckets].get(key)
  end

  def delete(key)
    @store[key.hash%num_buckets].remove(key) if include?(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |list|
      list.each {|link| prc.call(link.key, link.val)}
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = Array.new(2 * num_buckets) { LinkedList.new }
    @store.each do |list|
      list.each do |link|
        temp_store[link.key.hash % temp_store.length].insert(link.key, link.val)
      end
    end
    @store = temp_store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
