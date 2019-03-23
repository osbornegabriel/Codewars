Challenge Description
=====================

Implement the method Enumerable#accumulate which should behave exactly like Enumerable#reduce and Enumerable#inject.

For example:

Sum some numbers
(5..10).accumulate(:+)
=> 45

Same using symbol to proc
(5..10).accumulate(&:+)
=> 45

Same using a block
5..10).accumulate { |sum, n| sum + n }
=> 45

Multiply some numbers
(5..10).accumulate(1, :*)
=> 151200

Same using a block
(5..10).accumulate(1) { |product, n| product * n }
=> 151200

find the longest word
longest = %w{ cat sheep bear }.accumulate do |memo, word|<br>
  memo.length > word.length ? memo : word<br>
end

longest
=> "sheep"

It should also chain with other enumerables properly, and exhibits various edge case behaviours that Enumerable#inject has (see example tests for details).

Enumerable#reduce and Enumerable#inject have been disabled for the purpose of this kata.

[Link to original challenge](https://www.codewars.com/kata/52f863119ac9ced78b0006ff/train/ruby)