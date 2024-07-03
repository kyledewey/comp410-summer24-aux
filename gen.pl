example(foo) :-
    writeln(first).
example(bar) :-
    writeln(second).
example(baz) :-
    writeln(third).
example(_) :-
    writeln(fourth),
    fail.

myNumber(0).
myNumber(1).
myNumber(2).

myNumberPlusFive(X) :-
    myNumber(Y),
    X is Y + 5.

makePair(Output) :-
    myNumber(A),
    myNumber(B),
    Output = pair(A, B).

% exp ::= variable(x) | variable(y) |
%         call(exp, exp)
gen(_, variable(x)).
gen(_, variable(y)).
gen(Depth, call(E1, E2)) :-
    Depth > 0,
    NewDepth is Depth - 1,
    gen(NewDepth, E1),
    gen(NewDepth, E2).
