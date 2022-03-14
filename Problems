********************************************************

only_odd_digits(X):- 
    X > 0,
    X is mod(X, 10),
    1 is mod(X, 2), !.

only_odd_digits(N):- 
     N > 0,
     Last is mod(N, 10),
     1 is mod(Last, 2),
     Next is div(N, 10),
     only_odd_digits(Next).
 *******************************************************
 
 
