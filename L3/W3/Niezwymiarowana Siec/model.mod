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

/* Input data */
data;

param P_count := 2;/* liczba sciezek*/
param E_count := 16; /*liczba krawedzi*/
param D_count := 2; /*liczba zapotrzebowan*/
param M := 10; /*modul przeplywnosci do zainstalowania na laczu (np. 10Gb/s SFP)*/
/*wartosci zapotrzebowan, po 10 dla pierwszego i drugiego*/
param : h :=
 1      10
 2      10
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
/*Koszty jednostkowe dla konkretnych linkow.*/
param : KSI :=
 1      90
 2      30
 3      10
 4      30
 5      10
 6      10
 7      35
 8      40
 9      50
 10     15
 11     10
 12     30
 13     25
 14     45
 15     90
 16     35
;

end;
