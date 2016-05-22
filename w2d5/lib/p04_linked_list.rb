require "byebug"

class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable
  attr_reader :head, :tail
  def initialize
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head == nil
  end

  def get(key)
    self.each do |link|
      return link.val if link.key == key
    end
    return nil
  end

  def include?(key)
    self.each do |link|
      return true if link.key == key
    end
    return false
  end

  def insert(key, val)
    newest = Link.new(key,val)
    if @head == nil
      @head = newest
      @tail = @head
    else
      @tail.next = newest
      newest.prev = @tail
      @tail = newest
    end
  end

  def remove(key)
    self.each do |link|
      if link.key == key
        if @head != nil && @head.key == link.key
          @head = link.next
        end
        if @tail != nil && @tail.key == key
          @tail = link.prev
        end
        link.prev.next = link.next unless link.prev == nil
        link.next.prev = link.prev unless link.next == nil
      end
    end
    nil
  end

  def each(&prc)
    upcoming = @head.next unless @head == nil
    current = @head
    until current == nil
      prc.call(current)
      current = upcoming
      upcoming = upcoming.next unless upcoming == nil
    end

    return self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
