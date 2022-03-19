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
 
 %base
riffle([],[],[],_):-!.

%first from left, second right
riffle([First|Left],[Second|Right],[First,Second|Result],left):-riffle(Left,Right,Result,left).
%second left, first right
riffle([Second|Left],[First|Right],[First,Second|Result],right):-riffle(Left,Right,Result,right).
    
