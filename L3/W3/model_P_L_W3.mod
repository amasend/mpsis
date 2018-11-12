# MPSiS 2018/2019
# Model UFAP, P/L

/* Number of vertexes, edges, dispositions */
param P_count, integer, >= 0;
param E_count, integer, >= 0;
param D_count, integer, >= 0;


/* Sets of vertexes, edges and dispositions */
set P, default {1..P_count};
set E, default {1..E_count};
set D, default {1..D_count};

/* Requirements */
param h{d in D} >= 0;
param LAM{e in E, d in D, p in P} >= 0, default 0;
param M, integer, default 1;

/* Capacity */
param c{e in E} >= 0, default 10;

/* KSI */
param KSI{e in E} >= 0;

/* Decision variables */
var x{d in D, p in P} >= 0;
var y{e in E} >= 0;

/* Objective function 'z' */
minimize z: sum{e in E} (KSI[e]*y[e]);

/* Constraints */
s.t. c1{d in D} : h[d] == sum{p in P} x[d,p];
s.t. c2{e in E} : M/2*y[e] >= sum{d in D, p in P} LAM[e,d,p]*x[d,p];
s.t. c3{e in E} : c[e] >= sum{p in P, d in D} LAM[e,d,p]*x[d,p];

end;
