% AIML Practical 8: A* Search using f(n) = g(n) + h(n)
% Sample query: ?- a_star(s, g, Path, Cost).
% For admissible heuristics, A* returns an optimal path.

edge(s, a, 1). edge(s, b, 4).
edge(a, c, 2). edge(a, d, 5).
edge(b, d, 1). edge(c, g, 5). edge(d, g, 2).

heuristic(s, 6). heuristic(a, 4). heuristic(b, 3).
heuristic(c, 4). heuristic(d, 1). heuristic(g, 0).

neighbors(X, Ns) :-
    findall(Y-C, edge(X, Y, C), Forward),
    findall(Y-C, edge(Y, X, C), Backward),
    append(Forward, Backward, Ns).

a_star(Start, Goal, Path, Cost) :-
    astar([[0, Start, [Start]]], Goal, RevPath, Cost),
    reverse(RevPath, Path).

astar([[Cost, Goal, Path]|_], Goal, Path, Cost).
astar(Frontier, Goal, ResultPath, ResultCost) :-
    select([G, Current, Path], Frontier, Remaining),
    findall([F, Next, [Next|Path]],
        (neighbors(Current, Ns), member(Next-StepCost, Ns),
         \\+ member(Next, Path),
         G1 is G + StepCost,
         heuristic(Next, H), F is G1 + H),
        NewNodes),
    append(Remaining, NewNodes, Combined),
    sort(Combined, Sorted),
    astar(Sorted, Goal, ResultPath, ResultCost).
