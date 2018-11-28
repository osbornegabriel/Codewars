def is_polydivisible(s, b)
  #your code here
end

def get_polydivisible(n, b)
  #your code here
end

def convert_to_base_10(s,b)
  s.chars.reverse.map.with_index{|n,i| n.to_i * (b ** i)}.reduce(:+)
end