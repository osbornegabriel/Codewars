_original link to challenge_: https://www.codewars.com/kata/ruby-functions-number-1-define-the-each-function/train/ruby

Introduction
Ruby is an extremely flexible programming language with tons of useful functions already built into the framework. Have you ever thought about how each functions work? That is what we are going to find out in this Kata series. Our goal is to rewrite many Ruby functions to learn about the inner magic of Ruby.

The Task
To those not familiar with the each function. Here is a demonstration:

arr = [1, 2, 3, 4, 5]

arr.each do |x|
  puts x
end

######### output ############
1
2
3
4
5
The each function iterates through each element of the array and apply the block to that element. The each function does not modify the original array, so you will have to set the result to equal to a variable to save the result.

For this Kata, your goal is to return a new array after applying the block.

res = []
arr = [1, 2, 3, 4, 5]
arr.each { |x| res << (2 * x) }
res

######### output ############
[2, 4, 6, 8, 10]
I have disabled many of the build-in array functions. So build you own. You only need to build the each function, and I will supply the blocks to be apply to the array. Please see example tests.

Good luck.