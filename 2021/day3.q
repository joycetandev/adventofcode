data:flip "I"$string each read0 `:input_day3.txt;

data:flip (`$string 1 + til count data)!data;

getbitstats:{ { ungroup ([] position:key x; bit:value key each x; bitcount:value count each' value each x) } group each flip x };

// part 1

gamma:2 sv exec bit from select from getbitstats data where bitcount = (max;bitcount) fby position;

epsilon:2 sv exec bit from select from getbitstats data where bitcount = (min;bitcount) fby position;

gamma*epsilon // answer

// part 2

getrating:{[defaultbit; maxormin; data; pos]
    bitstats:select from getbitstats data where position = `$string pos, bitcount = (maxormin;bitcount) fby position;
    if[1 < count bitstats; bitstats:select from bitstats where bit = defaultbit];
    wc:{ flip enlist[count[key x]#(=)],enlist[`$string key x],enlist[value x] } { ("I"$string exec position from x)!(exec bit from x) } bitstats;
    output:?[data; wc; 0b; ()];
    output
};

oyxgengenerator:2 sv first value each (getrating[1i; max]/)[data; 1 + til count cols data];

co2scrubber:2 sv first value each (getrating[0i; min]/)[data; 1 + til count cols data];

oyxgengenerator*co2scrubber // answer