% [1, 2, 3]
% Python: Cons(1, Cons(2, Cons(3, Nil())))
% Prolog: cons(1, cons(2, cons(3, nil)))


% append([1, 2, 3], [4, 5, 6]) ==> [1, 2, 3, 4, 5, 6]
% def append(list1, list2):
%   if isinstance(list1, Nil):
%     return list2 # [].append([3, 4, 5])
%   else: # isinstance(list1, Cons)
%     rest = append(list1.tail, list2) # append([2, 3], [4, 5, 6])  ==> [2, 3, 4, 5, 6]
%     return Cons(list1.head, rest) # [1, 2, 3, 4, 5, 6]
myAppend([], List2, List2).
myAppend([Head|Tail], List2, Output) :-
    myAppend(Tail, List2, Rest),
    Output = [Head|Rest].

% TODO: cleanup, run, trace
