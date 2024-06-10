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
