original link: https://www.codewars.com/kata/connect-four-1/train/ruby

##Connect Four##
Take a look at wiki description of Connect Four game:

Wiki Connect Four

The grid columns are named from A to G:

alt text

You will receive a list of string that shows the order of the pieces which dropped in columns:

std::vector<std::string> pieces_position_list

{
  "A_Red",
  "B_Yellow",
  "A_Red",
  "B_Yellow",
  "A_Red",
  "B_Yellow",
  "G_Red",
  "B_Yellow"
}

The list may contains 42 or less strings, but the order shows the order that players are playing.

The first player who connect four items in same color is the winner.

you should return "Yellow", "Red" or "Draw".