# MPSiS 2018/2019
# Model UFAP, P/L

/* Number of vertexes, edges, dispositions */
param V_count, integer, >= 0;
param E_count, integer, >= 0;
param D_count, := 2*(V_count*(V_count-1))/2;
param K_count, integer, >= 0;

/* Sets of vertexes, edges and dispositions */
set V, default {1..V_count};
set E, default {1..E_count};
set D, default {1..D_count};
set K, default {1..K_count};

/* Requirements */
param n{d in D} >= 0;
param m{d in D} >= 0;
param h{d in D} := abs(n[d]-m[d])*20;
param W, default 100000;
param A{e in E, v in V}, >= 0, default 0;
param B{e in E, v in V}, >= 0, default 0;
param ksi, default 10;
param M{e in E, k in K} := 100*k;

/* Decision variables */
var x{e in E, d in D} >= 0;
var u{e in E}, binary, >= 0;
var y{e in E}, integer, >= 0;

/* Objective function 'z' */
minimize z: sum{e in E} (y[e] + ksi*u[e]);

/* Constraints */
s.t. c3{e in E, k in K} : sum{d in D} x[e,d] <= y[e]*M[e,k];
s.t. c4{d in D, v in V : v == n[d]} : sum{e in E} (A[e,v]*x[e,d] - B[e,v]*x[e,d]) == h[d];
s.t. c5{d in D, v in V : v <> n[d] and v <> m[d]} : sum{e in E} (A[e,v]*x[e,d] - B[e,v]*x[e,d]) == 0;
s.t. c6{d in D, v in V : v == m[d]} : sum{e in E} (A[e,v]*x[e,d] - B[e,v]*x[e,d]) == -h[d];
s.t. c7{e in E} : y[e] <= W*u[e];

/* Input data */
data;

param V_count := 12;
param E_count := 36;
param K_count := 11;

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
 12     2 1
 13     2 3
 14     2 4
 15     2 5
 16     2 6
 17     2 7
 18     2 8
 19     2 9
 20     2 10
 21     2 11
 22     2 12
 23     3 1
 24     3 2
 25     3 4
 26     3 5
 27     3 6
 28     3 7
 29     3 8
 30     3 9
 31     3 10
 32     3 11
 33     3 12
 34     4 1
 35     4 2
 36     4 3
 37     4 5
 38     4 6
 39     4 7
 40     4 8
 41     4 9
 42     4 10
 43     4 11
 44     4 12
 45     5 1
 46     5 2
 47     5 3
 48     5 4
 49     5 6
 50     5 7
 51     5 8
 52     5 9
 53     5 10
 54     5 11
 55     5 12
 56     6 1
 57     6 2
 58     6 3
 59     6 4
 60     6 5
 61     6 7
 62     6 8
 63     6 9
 64     6 10
 65     6 11
 66     6 12
 67     7 1
 68     7 2
 69     7 3
 70     7 4
 71     7 5
 72     7 6
 73     7 8
 74     7 9
 75     7 10
 76     7 11
 77     7 12
 78     8 1
 79     8 2
 80     8 3
 81     8 4
 82     8 5
 83     8 6
 84     8 7
 85     8 9
 86     8 10
 87     8 11
 88     8 12
 89     9 1
 90     9 2
 91     9 3
 92     9 4
 93     9 5
 94     9 6
 95     9 7
 96     9 8
 97     9 10
 98     9 11
 99     9 12
 100     10 1
 101     10 2
 102     10 3
 103     10 4
 104     10 5
 105     10 6
 106     10 7
 107     10 8
 108     10 9
 109     10 11
 110     10 12
 111     11 1
 112     11 2
 113     11 3
 114     11 4
 115     11 5
 116     11 6
 117     11 7
 118     11 8
 119     11 9
 120     11 10
 121     11 12
 122     12 1
 123     12 2
 124     12 3
 125     12 4
 126     12 5
 127     12 6
 128     12 7
 129     12 8
 130     12 9
 131     12 10
 132     12 11
;

param : A :=
 1,1    1
 2,1    1
 3,5    1
 4,2   1
 5,2    1
 6,3    1
 7,3   1
 8,4   1
 9,8   1
 10,9   1
 11,10   1
 12,5   1
 13,9   1
 14,10  1
 15,11   1
 16,11   1
 17,12  1
 18,7  1
 19,5  1
 20,2   1
 21,4   1
 22,3   1
 23,4  1
 24,9   1
 25,8   1
 26,10   1
 27,8   1
 28,7   1
 29,7   1
 30,11   1
 31,12   1
 32,6   1
 33,6   1
 34,6   1
 35,7   1
 36,7   1
;  

param : B :=
 1,2    1
 2,5    1
 3,4    1
 4,4   1
 5,3    1
 6,6    1
 7,7   1
 8,7   1
 9,7   1
 10,8   1
 11,8   1
 12,9   1
 13,10   1
 14,11  1
 15,7   1
 16,12   1
 17,6  1
 18,6  1
 19,1  1
 20,1   1
 21,2   1
 22,2   1
 23,5  1
 24,5   1
 25,9   1
 26,9   1
 27,10   1
 28,8   1
 29,11   1
 30,10   1
 31,11   1
 32,12   1
 33,7   1
 34,3   1
 35,3   1
 36,4   1
;

end;

