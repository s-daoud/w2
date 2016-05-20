def my_min1(arr)
  min = arr[0]
  arr.each do |el|
    arr.each do |el2|
      if min > el
        min = el if el < el2
      end
    end
  end

  min
end
# big O(n^2)

def my_min2(arr)
  min = arr[0]
  arr.each do |el|
    if min > el
      min = el
    end
  end

  min
end

# O(n)

def subsums(arr)
  subs = []
  arr.each_with_index do |el, i|
    arr[(i + 1)..-1].each_with_index do |el2, j|
      subs << arr[i..(i + j + 1)]
    end
  end
  subs.map { |el| el.reduce(:+) }.max
end

#O(n^2)

def subsums2(arr)
  largest_sum = arr[0]
  temp_sum = 0
  arr.each_with_index do |el, i|
    temp_temp_sum = temp_sum
    temp_sum += el
    if temp_temp_sum > temp_sum
      temp_sum = 0
    end
    if temp_sum > largest_sum
      largest_sum = temp_sum
    end
  end
  largest_sum
end



# O(n) time O(1) space
p subsums2([5, 3, -7])
