def first_anagram?(str1, str2)
  str1.chars.permutation.to_a.map(&:join).include?(str2)
end
# O(n!)

def second_anagram?(str1, str2)
  str1.dup.chars.each do |el|
    str2.dup.chars.each do |el2|
      if el == el2
        str1.delete!(el)
        str2.delete!(el2)
      end
    end
  end
  str1.empty? && str2.empty?
end
# O(n^2)

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end
# O(nlogn)

def fourth_anagram?(str1, str2)
  hash = Hash.new(0)
  # hash2 = Hash.new(0)
  str1.chars.each { |el| hash[el] += 1 }
  str2.chars.each { |el| hash[el] -= 1 }
  hash.values.all? { |el| el == 0 }
end
# O(n)

p fourth_anagram?("cat", "act")
