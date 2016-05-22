require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require "byebug"

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new(max)
    @store = LinkedList.new
    @max = max
    unless prc
      @prc = Proc.new{|i| i ** 2}
    else
      @prc = prc
    end
  end

  def count
    @map.count
  end

  def get(key)
    debugger
    if @map.include?(key)
      links_key = @map.get(key)
      @map.delete(key)
      @store.remove(links_key)
    elsif @map.count == @max
      eject!
    else
      links_key = @prc.call(key)
    end
    @map.set(key, links_key)
    @store.insert(links_key, key)
    return links_key
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
  end

  def eject!
    @map.delete(@store.head.val)
    @store.remove(@store.head.key)
  end
end
