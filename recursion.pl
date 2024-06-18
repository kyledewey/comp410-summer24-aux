% fib(0) = 0
% fib(1) = 1
% fib(n) = fib(n - 1) + fib(n - 2), if n > 1

% fib(Input, Output)
fib(0, 0).
fib(1, 1).
fib(N, Output) :-
    N > 1,
    NMinusOne is N - 1,
    fib(NMinusOne, LeftResult),
    NMinusTwo is N - 2,
    fib(NMinusTwo, RightResult),
    Output is LeftResult + RightResult.

% factorial(0) = 1
% factorial(n) = n * factorial(n - 1), if n > 0
factorial(0, 1).
factorial(N, Output) :-
    N > 0,
    NMinusOne is N - 1,
    factorial(NMinusOne, Result),
    Output is Result * N.

% [0, 5]
% Call 1: First Rule
% Call 1: Second Rule
%   Call 2: First Rule
%   Call 2: Second Rule
% myBetween: Low, High, Result
% [3, 2]
myBetween(Low, High, Low) :- % [0, 5] ==> 0 is an answer
    Low =< High.
myBetween(Low, High, X) :- % [0, 5] ==> recursive call with [1, 5]
    Low < High,
    Next is Low + 1,
    myBetween(Next, High, X).

myBetween2(Low, High, X) :-
    (Low = X,
     Low =< High);
    (Low < High,
     Next is Low + 1,
     myBetween2(Next, High, X)).

% plus(integer(5), integer(7))
% minus(integer(4), integer(2))
%
% arithEval: AST, Integer
arithEval(integer(X), X).
arithEval(plus(E1, E2), Result) :-
    % arithEval(E1) + arithEval(E2)
    arithEval(E1, E1Result),
    arithEval(E2, E2Result),
    Result is E1Result + E2Result.
arithEval(minus(E1, E2), Result) :-
    % arithEval(E1) + arithEval(E2)
    arithEval(E1, E1Result),
    arithEval(E2, E2Result),
    Result is E1Result - E2Result.

% writeAllInRange(Min, Max)
% ?- writeAllInRange(3, 3).
% 3
% true.
% ?- writeAllInRange(4, 8).
% 4
% 5
% 6
% 7
% 8
% true.
% ?- writeAllInRange(3, 2).
% fail.

writeAllInRange(Min, Max) :-
    Min < Max,
    writeln(Min),
    Next is Min + 1,
    writeAllInRange(Next, Max).
writeAllInRange(Max, Max) :-
    writeln(Max).


evensBetween(Min, Max, Min) :-
    Min =< Max,
    0 is mod(Min, 2).
evensBetween(Min, Max, Num) :-
    Min < Max,
    NewMin is Min + 1,
    evensBetween(NewMin, Max, Num).

productAll(X, X, X).
productAll(Min, Max, Result) :-
    Min < Max,
    NewMin is Min + 1,
    productAll(NewMin, Max, Rest),
    Result is Min * Rest.

% tailrecProductAll(Min, Max, Result)
tailrecProductAll(Min, Max, Result) :-
    tailrecProductAll(Min, Max, 1, Result).

% tailrecProductAll(Min, Max, Accum, Result)
tailrecProductAll(Min, Min, Accum, NewAccum) :-
    NewAccum is Min * Accum.
tailrecProductAll(Min, Max, Accum, Result) :-
    Min < Max,
    NewMin is Min + 1,
    NewAccum is Min * Accum,
    tailrecProductAll(NewMin, Max, NewAccum, Result).

element(gallium).
element(chlorine).

mp(water, 0).
mp(gallium, 30).
mp(chlorine, -102).

bp(water, BP) :-
    mp(water, MP),
    BP is MP + 100.
bp(gallium, 2400).
bp(chlorine, -34).

% ?- mp(E, MP), element(E), MP =< 0.
