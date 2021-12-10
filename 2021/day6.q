/ system "cd Desktop/adventofcode/2021"

// part 1

data:"I"$"," vs raze read0 `:input_day6.txt;

countfish:({[state;days]
    newfish:count[where state = 0]#8;
    state:state - 1;
    cnt:count[where state <= 6];
    state:mod[cnt#state;7],mod[_[cnt;state];8];
    state,newfish
}\[data;]);

count last countfish til 80 // answer (not ideal, refer to part 2 for better solution)

// part 2

data:"I"$"," vs raze read0 `:input_day6.txt;

// I surrender

// I surrendered and now I am back

// credits: https://gist.github.com/rain-1/51944f4ed9318c320cfa0af2a03e6808\
// credits: https://github.com/adotsch/aoc/tree/master/2021

sum 80 { @[1_x,0; 6 8; +; x[0]] }/ count each group[data] til 9 // answer