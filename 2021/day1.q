/ system "cd Desktop/adventofcode/2021"

// part 1

count { 1_x where x > 0 } deltas "I"$read0 `:input_day1.txt // answer

// part 2

count { 1_x where x > 0 } deltas sum each 2_{{ 1_x,y }\[x#0; y]}[3; "I"$read0 `:input_day1.txt] // answer