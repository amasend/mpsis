# MPSiS 2018/2019
# Model UFAP, P/L

/* Number of vertexes, edges, dispositions */
param P_count, integer, >= 0;
param E_count, integer, >= 0;
param D_count, integer, >= 0;
param I_count, integer, >= 0;


/* Sets of vertexes, edges and dispositions */
set P, default {1..P_count};
set E, default {1..E_count};
set D, default {1..D_count};
set I, default {1..I_count};

/* Requirements */
param h{d in D} >= 0;
param LAM{e in E, d in D, p in P} >= 0, default 0;
param W;
param a{i in I};
param b{i in I};

/* Decision variables */
var x{d in D, p in P} >= 0;
var y{e in E} >= 0;
var u{i in I, e in E}, binary, >= 0;
var o{i in I, e in E} >= 0;

/* Objective function 'z' */
minimize z: sum{i in I, e in E} (a[i]*y[e] + b[i]*u[i,e]);

/* Constraints */
s.t. c1{d in D} : h[d] == sum{p in P} x[d,p];
s.t. c2{e in E} : y[e] == sum{d in D, p in P} LAM[e,d,p]*x[d,p];
s.t. c3{e in E} : y[e] == sum{i in I} o[i,e];
s.t. c4{e in E} : sum{i in I} u[i,e] == 1;
s.t. c5{i in I, e in E} : o[i,e] <= W*u[i,e];


/* Input data */
data;

param P_count := 2;/* liczba sciezek*/
param E_count := 16; /*liczba krawedzi*/
param D_count := 2; /*liczba zapotrzebowan*/
param I_count := 4; /*liczba funkcji liniowych przyblizajacych*/
param W := 1000000; 
/*wartosci zapotrzebowan, po 10 dla pierwszego i drugiego*/
param : h :=
 1      3
 2      4
;
param : a :=
 1      0.5
 2      3.14
 3	0.16
 4	0.13
;
param : b :=
 1      0
 2      -2.43
 3	1.56
 4	1.86
;
/*Macierz delta 
(mowi ktore linki 
wchodza w sklad 
jakich sciezek)*/
param : LAM :=
 2,1,1   1
 8,1,1   1
 11,1,1  1
 14,1,1  1
 15,1,1  1

 1,1,2   1
 3,1,2   1
 7,1,2   1
 10,1,2  1
 13,1,2  1

 8,2,1   1
 11,2,1  1
 14,2,1  1
 15,2,1  1
 16,2,1  1

 3,2,2   1
 5,2,2   1
 6,2,2   1
 10,2,2  1
 13,2,2  1
 16,2,2  1
;

end;
