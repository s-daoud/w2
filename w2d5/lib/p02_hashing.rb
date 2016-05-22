class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = self.each.with_index.inject(0){ |sum, (el, i)| i.hash + el.hash }
    "array".hash + length.hash + sum.hash
  end
end

class String
  def hash
    sum = self.chars.map(&:ord).each.with_index.inject(0){|sum, (el, i)| i.hash + el.hash}
    "string".chars.map(&:ord).reduce(0,:+).hash + length.hash + sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = []
    each {|key, value| sum << [key,value]}
    sum = sum.sort
    "hash".hash + sum.hash + sum.length.hash
  end
end
