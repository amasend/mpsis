# kod zaczerpniety od konradadamczykk

# MPSiS 2018/2019
# Model UFAP, N/L

/* Number of vertexes, edges, dispositions */
param V_count, integer, >= 0;
param E_count, integer, >= 0;
param D_count, integer, >= 0;

/* Sets of vertexes, edges and dispositions */
set V, default {1..V_count};
set E, default {1..E_count};
set D, default {1..D_count};

/* Requirements */
param h{d in D} >= 0;
param s{d in D} >= 0;
param t{d in D} >= 0;

/* Aev, Bev as params */
param A{e in E, v in V}, >= 0, default 0;
param B{e in E, v in V}, >= 0, default 0;

/* Capacity */
param c{e in E} >= 0, default 15;

/* KSI xD */
param KSI{e in E} >= 0;

/* Decision variables */
var x{e in E, d in D} >= 0;

/* Objective function 'z' */
minimize z: sum{e in E, d in D} KSI[e]*x[e,d];

/* Constraints */
s.t. c1{d in D, v in V : v == s[d]} : sum{e in E} (A[e,v]*x[e,d] - B[e,v]*x[e,d]) == h[d];
s.t. c2{d in D, v in V : v <> s[d] and v <> t[d]} : sum{e in E} (A[e,v]*x[e,d] - B[e,v]*x[e,d]) == 0;
s.t. c3{d in D, v in V : v == t[d]} : sum{e in E} (A[e,v]*x[e,d] - B[e,v]*x[e,d]) == -h[d];
s.t. c4{e in E} : sum{d in D} x[e,d] <= c[e];


printf{e in E, v in V} "A[%d,%d] = %d, B[%d,%d] = %d\n", e, v, A[e, v], e, v, B[e, v];
printf{e in E} "KSI[%d] = %d, c[%d] = %d\n", e, KSI[e], e, c[e];
printf{d in D} "s[%d] = %d, t[%d] = %d, h[%d] = %d\n", d, s[d], d, t[d], d, h[d];

end;
