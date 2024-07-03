% 1.)
addAmount([], _, []).
addAmount([H1|T1], Amount, [H2|T2]) :-
    H2 is Amount + H1,
    addAmount(T1, Amount, T2).

% 2.)
extractLessThan([], _, []).
extractLessThan([H|T1], Cutoff, [H|T2]) :-
    H < Cutoff,
    extractLessThan(T1, Cutoff, T2).
extractLessThan([H|T1], Cutoff, T2) :-
    H >= Cutoff,
    extractLessThan(T1, Cutoff, T2).

% 3.)
interleave([], [], []).
interleave([H1|T1], [H2|T2], [H1, H2|Rest]) :-
    interleave(T1, T2, Rest).

% 4.)
sumBetween(Min, Max, Sum) :-
    sumBetween(Min, Max, 0, Sum).

% sumBetween(Min, Max, Accum, Sum)
sumBetween(Min, Min, Accum, Sum) :-
    Sum is Min + Accum.
sumBetween(Min, Max, Accum, Sum) :-
    Min < Max,
    NewMin is Min + 1,
    NewAccum is Min + Accum,
    sumBetween(NewMin, Max, NewAccum, Sum).

%% sumBetween(Min, Max, Sum) :-
%%     Min =< Max,
%%     sumBetween(Min, Max, 0, Sum).

%% sumBetween(Min, Max, Sum, Sum) :-
%%     Min > Max.
%% sumBetween(Min, Max, Accum, Sum) :-
%%     Min =< Max,
%%     NewA is Accum + Min,
%%     NewMin is Min + 1,
%%     sumBetween(NewMin, Max, NewA, Sum).

% 5.)
% exp ::= true | false | and(exp, exp) | or(exp, exp)

gen(true).
gen(false).
gen(and(E1, E2)) :-
    gen(E1),
    gen(E2).
gen(or(E1, E2)) :-
    gen(E1),
    gen(E2).
