def is_polydivisible?(s, b)
  s.length.times do |i|
    test_n = s.slice(0,i+1)
    b10_test = convert_to_base_10(test_n,b)
    return false if b10_test % (i + 1) != 0
  end
  true
end

def get_polydivisible(n, b)
  return '0' if n == 1
  b10_val = 0
  until n == 0 do
    b_val = convert_from_base_10(b10_val,b)
    n -= 1 if is_polydivisible(b_val,b)
    return b_val if n == 0
    b10_val += 1
  end
end

def convert_to_base_10(s,b)
  a = s.chars.reverse
  a.map!{|l| CHARS.index(l)}
  a.map.with_index{|n,i| n.to_i * (b ** i)}.reduce(:+)
end

def convert_from_base_10(i,b)
  return i.to_s(b).upcase if b < 37
  table = base_table(i,b)
  solution = Array.new
  table.each do |d|
    value = i / d
    solution.push(CHARS[value])
    i %= d
  end
  solution.join.sub!(/^0*/,"")
end

def base_table(i,b)
  table_length = (i.to_s.length / (b.to_f / 10)).ceil
  table = (0..table_length).to_a
  table.map!{|n| b ** (n)}
  table.reverse
end