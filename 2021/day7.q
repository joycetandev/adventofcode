/ system "cd Desktop/adventofcode/2021"

// part 1

data:"I"$"," vs raze read0 `:input_day7.txt;

{ 1 + ?[x;min x] } sum each abs data -/: 1 + til max data // horizontal position

min sum each abs data -/: 1 + til max data // answer

// part 2

costs:sums til max data

min sum each costs abs data -/: 1 + til max data // answer