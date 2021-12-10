/ system "cd Desktop/adventofcode/2021"

// part 1

data:read0 `:input_day8.txt;

segments:.[!;] flip (
    (0; `a`b`c`e`f`g);
    (1; `c`f);
    (2; `a`c`d`e`g);
    (3; `a`c`d`f`g);
    (4; `b`c`d`f);
    (5; `a`b`d`f`g);
    (6; `a`b`d`e`f`g);
    (7; `a`c`f);
    (8; `a`b`c`d`e`f`g);
    (9; `a`b`c`d`f`g)
);

{ count where raze x in count'[segments][1 4 7 8] } { count each vs[" ";x] } each last flip vs[" | ";] each data // answer

// part 2

// @todo how does where@' work?

data:read0 `:input_day8.txt;

data:" " vs'/: " | " vs/: data;

// https://imgur.com/a/LIS2zZr

sum
{
    input:asc each first x;
    output:asc each last x;
    segments:0#'input;
    segments[1 4 7 8]:input raze where@'2 4 3 7 =\: count each input;
    segments[9]:raze s where@(all each all each segments[4] in/: s) and (6 = count each s:input except segments);
    segments[0]:raze s where@(all each all each segments[7] in/: s) and (6 = count each s:input except segments);
    segments[6]:raze s where@6 = count each s:input except segments;
    segments[3]:raze s where@(all each all each segments[7] in/: s) and (5 = count each s:input except segments);
    segments[5]:raze s where@3 = count each segments[4] inter/: s:input except segments;
    segments[2]:raze input except segments;
    "I"$raze string (segments!til[10]) output
}
each data // answer