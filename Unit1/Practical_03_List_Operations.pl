% AIML Practical 3: append, reverse, member search, list length
% Sample queries:
% ?- append_lists([a,b], [c,d], R).
% ?- reverse_list([1,2,3], R).
% ?- contains_item(b, [a,b,c]).
% ?- list_length([a,b,c], N).

append_lists([], L, L).
append_lists([H|T], L, [H|R]) :- append_lists(T, L, R).

reverse_list(L, R) :- reverse_acc(L, [], R).
reverse_acc([], Acc, Acc).
reverse_acc([H|T], Acc, R) :- reverse_acc(T, [H|Acc], R).

contains_item(X, [X|_]).
contains_item(X, [_|T]) :- contains_item(X, T).

list_length([], 0).
list_length([_|T], N) :-
    list_length(T, N1),
    N is N1 + 1.
