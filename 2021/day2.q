// part 1

data:{ update depth:0i, horizontalpos:0i from ([] direction:x[0]; distance:"I"$x[1]) } flip " " vs' read0 `:input_day2.txt;

data:update neg distance from data where direction like "up";

data:update horizontalpos:(+) scan ?[direction like "forward";distance;0] from data;

data:update depth:(+) scan ?[direction in ("up";"down");distance;0] from data;

data

select last[depth]*last[horizontalpos] from data // answer

// part 2

data:{ update depth:0i, horizontalpos:0i from ([] direction:x[0]; distance:"I"$x[1]) } flip " " vs' read0 `:input_day2.txt;

data:update neg distance from data where direction like "up";

data:update horizontalpos:(+) scan ?[direction like "forward";distance;0] from data;

data:update aim:(+) scan ?[direction in ("up";"down");distance;0] from data;

data:update depth:(+) scan aim*?[direction like "forward";distance;0] from data;

data

select last[depth]*last[horizontalpos] from data // answer