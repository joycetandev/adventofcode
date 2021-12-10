/ system "cd Desktop/adventofcode/2021"

// part 1

data:"I"$string read0 `:input_day9.txt;

colscount:first count each data;

rowscount:count data;

/ { (.[data;]'') til[rowscount],'\:til[colscount] } // matrix

// version 1 (faster)
{
    checks:({
        currentval:.[data; x];
        adjacentvals:.[data;] each +[x;] each ((-1;0); (0;-1); (1;0); (0;1));
        adjacentvals:adjacentvals except 0N;
        
        :$[all adjacentvals > currentval;currentval;0N];
    }'')(til[rowscount],'\:til[colscount]);
    
    sum 1 + raze[checks] except 0N // answer
}[]

// version 2 (slower)

findneighbours:{ enlist[x],+[x;] each ((-1;0); (0;-1); (1;0); (0;1)) };

sum
{
    val:.[data; first[x]];
    neighbours:.[data;] each 1_x;
    $[all val < except[;0N] neighbours; val+1; 0]
} each findneighbours each raze til[rowscount],'\:til[colscount]

// part 2

// I surrender


