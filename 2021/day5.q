/ system "cd Desktop/adventofcode/2021"

// part 1

data:"I"$"," vs'/: (" -> " vs/: read0 `:input_day5.txt);

maxcoord:1 + max raze raze data;

getcoordslist:{[coord]
    possiblecoords:{ d:x where x within asc y; $[asc[y] ~ y; d; reverse d] }[til maxcoord;];
    flip { max[count each x]#'x } possiblecoords each coord
};

{ count x where x >= 2 } count each group raze getcoordslist each data where { any any not differ each flip x } each data // answer

// part 2

{ count x where x >= 2 } count each group raze getcoordslist each flip each data // answer