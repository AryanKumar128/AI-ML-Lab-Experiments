% AIML Practical 7: Greedy Best-First Search
% Selects the frontier path whose current node has the lowest heuristic h(n).
% This is not guaranteed to find the lowest-cost path.
% Sample query: ?- greedy_best_first(s, g, Path).

edge(s, a, 1). edge(s, b, 4).
edge(a, c, 2). edge(a, d, 5).
edge(b, d, 1). edge(c, g, 5). edge(d, g, 2).

heuristic(s, 6). heuristic(a, 4). heuristic(b, 3).
heuristic(c, 4). heuristic(d, 1). heuristic(g, 0).

neighbors(X, Ns) :-
    findall(Y-C, edge(X, Y, C), Forward),
    findall(Y-C, edge(Y, X, C), Backward),
    append(Forward, Backward, Ns).

greedy_best_first(Start, Goal, Path) :-
    greedy([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

greedy([[Goal|Rest]|_], Goal, [Goal|Rest]).
greedy(Frontier, Goal, Result) :-
    select_best_path(Frontier, [Current|Path], Remaining),
    findall([Next,Current|Path],
        (neighbors(Current, Ns), member(Next-_, Ns), \\+ member(Next, [Current|Path])),
        NewPaths),
    append(Remaining, NewPaths, Frontier1),
    sort_frontier(Frontier1, Sorted),
    greedy(Sorted, Goal, Result).

select_best_path(Frontier, Best, Remaining) :-
    sort_frontier(Frontier, [Best|Remaining]).

sort_frontier(Paths, Sorted) :-
    findall(H-P, (member(P, Paths), P=[Node|_], heuristic(Node,H)), Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values_local(SortedPairs, Sorted).

pairs_values_local([], []).
pairs_values_local([_-V|T], [V|R]) :- pairs_values_local(T, R).
