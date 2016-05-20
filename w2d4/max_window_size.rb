require_relative "minmax.rb"

def windowed_max_range1(arr, window)
  queue = []
  current_max_range = 0
  (window - 1).times do |j|
    queue.push(arr[j])
  end
  arr.drop(window - 1).each do |el|
    queue.push(el)
    diff = queue.max - queue.min
    if current_max_range < diff
      current_max_range = diff
    end
    queue.shift
  end
  current_max_range
end

def windowed_max_range(arr, window)
  queue = MinMaxStackQueue.new
  current_max_range = 0
  (window - 1).times do |j|
    queue.enqueue(arr[j])
  end
  arr.drop(window - 1).each do |el|
    queue.enqueue(el)
    diff = queue.max - queue.min
    if current_max_range < diff
      current_max_range = diff
    end
    queue.dequeue
  end
  current_max_range
end
rand_arr = (0...10000).to_a.shuffle

beginning_time = Time.now
p windowed_max_range(rand_arr, 10000)
end_time = Time.now
p end_time - beginning_time

beginning_time = Time.now
p windowed_max_range1(rand_arr, 10000)
end_time = Time.now
p end_time - beginning_time



# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
