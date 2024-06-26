foo(1).
foo(2) :-
    !.
foo(3).
foo(4).

evaluate(integer(X), X) :-
    !.
evaluate(plus(E1, E2), Result) :-
    !,
    evaluate(E1, E1Result),
    evaluate(E2, E2Result),
    Result is E1Result + E2Result.
evaluate(minus(E1, E2), Result) :-
    !,
    evaluate(E1, E1Result),
    evaluate(E2, E2Result),
    Result is E1Result + E2Result.

    
    
