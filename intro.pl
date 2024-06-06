% File: database

% facts
% these are forming a "procedure" - isInteger/1
% name: isInteger
% arity: 1 (number of parameters it takes)
isInteger(1).
isInteger(2).
isInteger(3).

% closed-world assumption - all truth is in this file.
% Anything not in this file is false.

% procedure areEqual/2
areEqual(A, B) :- % rule
    A = B.
% areEqual(X, X).

% "consult" a file - load it in

% isName/1 procedure
isName(alice). % fact - alice is an atom
isName(bob).   % fact - bob is an atom

isServedWarm(pizza).
isServedWarm(burger).
isServedWarm(burrito).

personLikes(alice, pizza).
personLikes(alice, burger).
personLikes(alice, burrito).
personLikes(alice, yogurt).
personLikes(bob, pizza).
personLikes(bob, burger).
personLikes(bob, salad).
personLikes(bob, milk).
personLikes(bill, Food) :-
    isServedWarm(Food).
personLikes(janet, Food) :-
    personLikes(alice, Food),
    personLikes(bob, Food).
personLikes(mel, Food) :-
    personLikes(janet, Food).
personLikes(mel, yogurt).

%% personLikes(mel, Food) :-
%%     personLikes(janet, Food); Food = yogurt.
%% personLikes(mel, Food) :-
%%     personLikes(janet, Food).
%% personLikes(mel, yogurt).
    
aliceLikes(pizza).
aliceLikes(burger).
aliceLikes(burrito).
aliceLikes(yogurt).

bobLikes(pizza).
bobLikes(burger).
bobLikes(salad).
bobLikes(milk).

% rules do computation
% rules can be recursive

between0and10(X) :-
    X >= 0,
    X =< 10.
