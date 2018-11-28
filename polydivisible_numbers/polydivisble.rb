def is_polydivisible?(s, b)
  s.length.times do |i|
    test_n = s.slice(0,i+1)
    b10_test = convert_to_base_10(test_n,b)
    return false if b10_test % (i + 1) != 0
  end
  true
end

def get_polydivisible(n, b)
  return 'radix issue' if b > 36
  test = 0
  until n == 0 do
    n -= 1 if is_polydivisible?(test.to_s(b),b)
    return test.to_s(b).upcase if n == 0
    test += 1
  end
end

def convert_to_base_10(s,b)
  a = s.chars.reverse
  a.map!{|l| CHARS.index(l)}
  a.map.with_index{|n,i| n.to_i * (b ** i)}.reduce(:+)
end