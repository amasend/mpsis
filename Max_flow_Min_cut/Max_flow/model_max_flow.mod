# MPSiS 2018/2019
# Model UFAP, N/L

/* Number of vertexes, edges, dispositions */
param V_count, integer, >= 0;
param E_count, integer, >= 0;

/* Sets of vertexes, edges and dispositions */
set V, default {1..V_count};
set E, default {1..E_count};

/* Requirements */
param s, integer, >= 0;
param t, integer, >= 0;

/* Aev, Bev as params */
param A{e in E, v in V}, >= 0, default 0;
param B{e in E, v in V}, >= 0, default 0;

/* Capacity */
param c{e in E} >= 0, default 0;

/*specific flow value*/
var x{e in E} >= 0; 

/* Objective function 'z' */
maximize z: sum{e in E} A[e,s]*x[e];

/* Constraints */
s.t. c1{e in E} : x[e] <= c[e];
s.t. c2{v in V : v <> s and v <> t} : sum{e in E} A[e,v]*x[e] - sum{e in E} B[e,v]*x[e] == 0;

end;
