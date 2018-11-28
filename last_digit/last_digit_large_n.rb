def last_digit(n1, n2)
  return 1 if n2 == 0
  n1_last_d = find_last_digit(n1)
  n2_simplifier = (n2 % 4).zero? ? 4 : n2 % 4
  find_last_digit(n1_last_d ** n2_simplifier)
end

def find_last_digit(n)
  n.to_s[-1].to_i
#   Math alternative:
#   n % 10
end