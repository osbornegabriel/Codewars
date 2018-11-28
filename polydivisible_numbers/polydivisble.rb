def is_polydivisible?(s, b)
  s.length.times do |i|
    test_n = s.slice(0,i+1)
    b10_test = convert_to_base_10(test_n,b)
    return false if b10_test % (i + 1) != 0
  end
  true
end

def get_polydivisible(n, b)
  #your code here
end

def convert_to_base_10(s,b)
  s.chars.reverse.map.with_index{|n,i| n.to_i * (b ** i)}.reduce(:+)
end