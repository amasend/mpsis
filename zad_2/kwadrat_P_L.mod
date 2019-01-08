/* odgorne ograniczenia na liczbe wiezcholkow, krawedzi, zapotrzebowan, przedzialow i sciezek */
param V_count, integer, >= 0;
param E_count, integer, >= 0;
param D_count, := (V_count*(V_count-1))/2;
param I_count, integer, >= 0;
param P_count, integer, >= 0;

/* wektory numerow wiezchokow, krawedzi, zapotrzebowan, przedzialow, sciezek */
set V, default {1..V_count};
set E, default {1..E_count};
set D, default {1..D_count};
set I, default {1..I_count};
set P, default {1..P_count};

/* stale */
param n{d in D} >= 0; /* poczatkowy wiezcholek */
param m{d in D} >= 0; /* koncowy wiezcholek */
param h{d in D} := abs(n[d]-m[d])*2; /* wartosc konkretnego zapotrzebowania */
param a{i in I}; /* parametr a z funkcji przyblizajacej w przedziale i */
param b{i in I}; /* parametr b z funkcji przyblizajacej w przedziale i */
param c{e in E} >= 0, default 100; /* przepustowosc linkow (gorna granica) */
param B := 1000; /* granica budzetu */
param W := 10000000; /* duza liczba do ograniczenia bifurkacji */
param LAMBDA{e in E, d in D, p in P} >= 0, default 0; /* macierz 0 i 1 mowiaca ktore lacze nalezy do konkretnej sciezki dla danego zapotrzebowania */


/* zmienne */
var x{d in D, p in P} >= 0; /* ilosc ruchu na danej sciezce dla danego zapotrzebowania */
var z{e in E} >= 0; /* koszt ruchu na danym laczu */
var y{e in E} >= 0; /* ilosc ruchu na danym laczu */
var ud in D, p in P}, binary; /* zmienna binarna mowiaca o tym ktora sciezka jest uzywana przez dane zapotrzebowanie */
var r >= 0; /* procentowa wielkosc przenoszonego ruchu dla kazdego zapotrzebowania */


/* Objective function 'z' */
maximize f: r;

/* Constraints */
s.t. c1 : r <= 1; /* r to procent wiec ulamek mniejszy niz 1 */
s.t. c2{i in I, e in E} : z[e] >= a[i] * y[e] + b[i]; /* linearyzacja */
s.t. c3 : sum{e in E} z[e] <= B; /* odgorne ograniczenie na koszt */
s.t. c4{e in E} : sum{d in D, p in P} LAMBDA[e,d,p] * h[d] * u[d,p] == y[e]; /* ktora sciezke wybrac */
s.t. c5{e in E} : y[e] <= c[e]; /* odgorne ograniczenie na lacze */
s.t. c6{d in D} : sum{p in P} x[d,p] == h[d] * r; /* sprawdzaj ile procent ruchu mozna przeslac i staraj sie jak najwiecej */
s.t. c7{d in D} : sum{p in P} u[d,p] == 1; /* wybieraj tylko jedna sciezke dla danego zapotrzebowania */
s.t. c8{d in D, p in P} : x[d,p] <= W * u[d,p]; /* podnos sciezke jezeli chcesz na niej przepuscic ruch */


/* Input data */
data;

param V_count := 12;
param E_count := 30;
param I_count := 3;
param P_count := 

param : a :=
 1      0.5
 2      1.5
 3	3
;
param : b :=
 1      0
 2      -0.5
 3	-2
;

param : n m :=
 1     1 2
 2     1 3
 3     1 4
 4     1 5
 5     1 6
 6     1 7
 7     1 8
 8     1 9
 9     1 10
 10     1 11
 11     1 12
 12     2 3
 13     2 4
 14     2 5
 15     2 6
 16     2 7
 17     2 8
 18     2 9
 29     2 10
 30    2 11
 31     2 12
 32     3 4
 33     3 5
 34     3 6
 35     3 7
 36     3 8
 37     3 9
 38     3 10
 39     3 11
 40     3 12
 41     4 5
 42     4 6
 43     4 7
 44     4 8
 45     4 9
 46     4 10
 47     4 11
 48     4 12
 49     5 6
 50     5 7
 51     5 8
 52     5 9
 53     5 10
 54     5 11
 55     5 12
 56     6 7
 57     6 8
 58     6 9
 59     6 10
 50     6 11
 61     6 12
 62     7 8
 63     7 9
 64     7 10
 65     7 11
 66     7 12
 67     8 9
 68     8 10
 69     8 11
 70     8 12
 71     9 10
 72     9 11
 73     9 12
 74     10 11
 75     10 12
 76     11 12
;

param : LAMBDA :=


end;
