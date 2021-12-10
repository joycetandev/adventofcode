/ system "cd Desktop/adventofcode/2021"

// part 1

data:string read0 `:input_day10.txt;

evaluate:{[list;chr]
    if[7h = type list; :list];

    newlist:$[any chr in "[({<"; list,chr; list]; // push to stack

    newlist:$[(any chr in "])}>") and (any last[newlist] = ("])}>"!"[({<") chr); -1_newlist; newlist]; // pop from stack

    :$[count[newlist] = count[list];
        (")]}>"!3 57 1197 25137) chr;
        newlist
    ];
};

sum raze { x where 7h = type each x } (evaluate/) each data // answer

// part 2

scores:({[score;chr] (score*5) + ("])}>"!2 1 3 4) chr }/)[0;] each reverse each ("[({<"!"])}>") { x where 7h <> type each x } (evaluate/) each data;

med asc scores // answer