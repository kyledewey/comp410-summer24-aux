% exp ::= integer(0) | plus(exp, exp)

evaluate(integer(N), N).
evaluate(plus(Exp1, Exp2), Result) :-
    evaluate(Exp1, Exp1Result),
    evaluate(Exp2, Exp2Result),
    Result is Exp1Result + Exp2Result.

% exp ::= integer(0) | plus(exp, exp) | negate(exp)
isValidExpression(integer(0)).
isValidExpression(plus(Exp1, Exp2)) :-
    isValidExpression(Exp1),
    isValidExpression(Exp2).
isValidExpression(negate(E)) :-
    isValidExpression(E).

boundedIsValidExpression(K, integer(0)) :-
    K >= 1.
boundedIsValidExpression(K, plus(E1, E2)) :-
    K > 1,
    NewK is K - 1,
    boundedIsValidExpression(NewK, E1),
    boundedIsValidExpression(NewK, E2).
boundedIsValidExpression(K, negate(E)) :-
    K > 1,
    NewK is K - 1,
    boundedIsValidExpression(NewK, E).

% e ::= true | false | if(e, e, e)
exp(true).
exp(false).
exp(if(E1, E2, E3)) :-
    exp(E1),
    exp(E2),
    exp(E3).

boundedExp(K, true) :-
    K >= 0.
boundedExp(K, false) :-
    K >= 0.
boundedExp(K, if(E1, E2, E3)) :-
    K > 0,
    NewK is K - 1,
    boundedExp(NewK, E1),
    boundedExp(NewK, E2),
    boundedExp(NewK, E3).
