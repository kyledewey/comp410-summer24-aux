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

% myBetween: Low, High, Result
myBetween(Low, High, Low) :-
    Low =< High.
myBetween(Low, High, X) :-
    Low < High,
    Next is Low + 1,
    myBetween(Next, High, X).

myBetween2(Low, High, X) :-
    (Low = X,
     Low =< High);
    (Low < High,
     Next is Low + 1,
     myBetween2(Next, High, X)).
