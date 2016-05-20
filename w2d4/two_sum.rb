def bad_two_sum?(arr, target)
  arr.each_with_index do |el, i|
    arr.each_with_index do |el2, j|
      next if i == j
      return true if el + el2 == target
    end
  end
  false
end
#O(n^2)
p bad_two_sum?([1, 2, 3], 5)
def okay_two_sum?(arr, target)
  arr.sort!
  arr.each_with_index do |el, i|
    return true if arr.bsearch{ |x| x == target - arr[i]}
  end

  false
end
p okay_two_sum?([1, 2, 3], 5)
# O(n*log(n))
require "set"
def pair_sum?(arr, target)
  set = Set.new(arr)
  set.each do |el|
    return true if set.include?(target - el)
  end

  false
end

p pair_sum?([1, 2, 3], 5)
