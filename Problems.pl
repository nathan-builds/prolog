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
    
    
    
*********************************************************
domino_cycle([(C,D)|T]):-
cycle_helper_function(T,D,_,C).
domino_cycle([(A,A)]).

cycle_helper_function([(Start,X)], _, Start, X).
cycle_helper_function([(Start,End)|Tail], Start, End, X):-
cycle_helper_function(Tail, End, _, X).



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
    
    
    
    
 *******************************************************    
    
count_dominators([], Answer):-
    Answer is 0,
    !.

count_dominators(NumList, Answer):-
    length(NumList, 1),
    Answer is 1, 
    !.

count_dominators(NumList, Answer):-
    reverse(NumList, RevNumList),
    dominator_helper_function(RevNumList, 0, 0, Answer).

dominator_helper_function([], _, C, Answer):-
    Answer is C, 
    !.

dominator_helper_function([H | T], Max, Count, Answer):-
    ( H > Max ->  
    NewCount = Count + 1, dominator_helper_function(T, H, NewCount, Answer) ;
    dominator_helper_function(T, Max, Count, Answer)).


********************************************************************************
extract_increasing(DigitString, Nums):-
    string_chars(DigitString, DigitList), 
    [Num1, Num2| T] = DigitList, 
    atom_number(Num1, Num1Number),
    atom_number(Num2, Num2Number),
    extract_helper(Num1Number, Num2Number, T, [Num1Number], Nums).


extract_helper(Num1, Num2, DigitList, Collector, Nums):-
    [Next | T] = DigitList,
        string_concat(Num2, Next, NewNext),
    atom_number(NewNext, NextInt),
    extract_helper(Num1, NextInt, T, Collector, Nums).

extract_helper(Num1, Num2, DigitList, Collector, Nums):-
    Num1 < Num2,
    append([Num2], Collector, NewCollector),
    [Next | T] = DigitList,
    atom_number(Next, NextInt),
    extract_helper(Num2, NextInt, T, NewCollector, Nums), !.
  

extract_helper(Num1, Num2, [], Collector, Nums):-
    ( Num1 < Num2 ->  
    append([Num2], Collector, NewCollector), reverse(NewCollector, Nums) ; reverse(Collector, Nums) ),
    !.

    
