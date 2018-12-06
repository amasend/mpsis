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

end;
