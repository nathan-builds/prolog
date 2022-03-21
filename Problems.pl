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
    

 *******************************************************

first_missing_positive(List,Num):-
    first_missing_positive(List,Num,1).

first_missing_positive(L,F,F):-
    not(member(F,L)),!.
first_missing_positive(L,N,F):-
    F1 is F+1,
    first_missing_positive(L,N,F1).



 *******************************************************
% if it fails this, it will do other, amount is greater so the coin 
%satisfies the initial condition
give_change(Amount, [H|T], [H|C1]):-
Amount >= H, 
AmountLeft is Amount - H,
give_change(AmountLeft, [H|T], C1).

% this succeeds it means we move to the next coin
give_change(AmountLeft, [H|T], ChangeLeft):-
AmountLeft < H, 
give_change(AmountLeft, T,ChangeLeft).
  	
% unify the end result
give_change(0, _, []):-
    _ = [].
