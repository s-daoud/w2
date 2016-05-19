class Array
  def my_uniq
    uniqed = []
    self.each do |el|
      uniqed << el unless uniqed.include?(el)
    end
    uniqed
  end

  def two_sum
    sum_zero = []
    self.each_with_index do |el, i|
      self[(i + 1)..-1].each_with_index do |el2, j|
        if el + el2 == 0
          sum_zero << [i, i + j + 1]
        end
      end
    end
    sum_zero
  end

  def my_transpose
    transposed = []
    self.length.times do |i|
      subarray = []
      self.length.times do |j|
        subarray << self[j][i]
      end
      transposed << subarray
    end
    transposed
  end

  def most_profit
    days = []
    self.each_with_index do |el, i|
      break if i + 1 == self.length
      current_best = self[1] - self[0]
      if self[i + 1] - self[i] >= current_best
        current_best = self[i + 1] - self[i]
        days = [i, i + 1]
      end
    end
    days
  end
end
