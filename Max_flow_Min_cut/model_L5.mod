# MPSiS 2018/2019
# Model UFAP, N/L

/* Number of vertexes, edges, dispositions */
param V_count, integer, >= 0;

/* Sets of vertexes, edges and dispositions */
set V, default {1..V_count};

/* Requirements */
param s, integer, >= 0;
param t, integer, >= 0;

/* Aev, Bev as params */
param E{v in V, w in V}, default -1;

/* Capacity */
param c{v in V, w in V} >= 0, default 0;
var b{v in V, w in V}, binary, >= 0;
var p{v in V}, binary, >= 0;

/* Objective function 'z' */
minimize z: sum{v in V, w in V} b[v,w]*c[v,w];

/* Constraints */
s.t. c1 : p[s] == 1;
s.t. c2 : p[t] == 0;
s.t. c3{v in V, w in V : E[v,w] == 1} : b[v,w] - p[v] + p[w] >= 0;
/*s.t. c4{v in V, w in V} : E[v,w]*c[v,w] >= 0;*/

data;

param V_count := 10;

param s := 1;
param t := 10;

param : E :=
 1,2      1
 2,1      1
 1,3      1
 3,1	  1
 2,3      1
 3,2	  1
 2,5      1
 5,2	  1
 2,6      1
 6,2	  1
 3,6      1
 6,3	  1
 3,4      1
 4,3	  1
 4,6      1
 6,4	  1
 5,8      1
 8,5	  1
 5,7      1
 7,5	  1
 6,7      1
 7,6	  1
 6,9      1
 9,6	  1
 7,9      1
 9,7	  1
 10,8     1
 8,10	  1
 7,10     1
 10,7	  1
 9,10     1
 10,9	  1
;

param : c :=
 1,2      30
 2,1      30
 1,3      90
 3,1	  90
 2,3      10
 3,2	  10
 2,5      40
 5,2	  40
 2,6      35
 6,2	  35
 3,6      30
 6,3	  30
 3,4      10
 4,3	  10
 4,6      10
 6,4	  10
 5,8      30
 8,5	  30
 5,7      10
 7,5	  10
 6,7      15
 7,6	  15
 6,9      50
 9,6	  50
 7,9      45
 9,7	  45
 10,8     35
 8,10	  35
 7,10     25
 10,7	  25
 9,10     90
 10,9	  90
;


end;
