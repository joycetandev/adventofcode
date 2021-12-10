/ system "cd Desktop/adventofcode/2021"

// part 1

data:read0 `:input_day4.txt;

draws:"I"$"," vs raze 1#data;

data:{[data] { row:" " vs' x; "I"$row except\: enlist "" } each ((distinct 6 xbar til count data),\'5) sublist\: data } 2_data;

getpossiblecombos:{[board] board, flip board };

scores:{[draws; boards; drawnumber]
    winningnumbers:drawnumber#draws;

    strikes:{[winningnumbers; board] winningnumbers inter/: board }[winningnumbers;] each boards;
    bingo:{ where any each x = 5 } (count'') strikes;
    bingo:first bingo;

    unmarkednumbers:distinct[raze boards[bingo]] except distinct[raze strikes[bingo]];

    sum[unmarkednumbers]*last[winningnumbers]
}[draws; getpossiblecombos each data]'[5_0 + til count draws];

{ first x where x > 0 } scores // answer

// part 2

{ last x where x > 0 } scores // answer