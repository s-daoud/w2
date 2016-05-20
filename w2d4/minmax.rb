class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end


class MyStack
  def initialize
    @store = []
  end

  def push(el)
    @store.push(el)
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MinMaxStackQueue
  def initialize
    @store = MyStack.new
    @store2 = MyStack.new
    @max_values = MyStack.new
    @min_values = MyStack.new
    @window = []
  end

  def enqueue(el)
    @max_values.push(el) if @max_values.empty? || el > @max_values.peek
    @min_values.push(el) if @min_values.empty? || el < @min_values.peek
    @store.push(el)
  end

  def dequeue
    if @store2.empty?
      until @store.empty?
        @store2.push(@store.pop)
      end
    end

    el = @store2.pop
    if @max_values.peek == el
      @max_values.pop
    end
    if @min_values.peek == el
      @min_values.pop
    end
  end

  def max
    @max_values.peek
  end

  def min
    @min_values.peek
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
