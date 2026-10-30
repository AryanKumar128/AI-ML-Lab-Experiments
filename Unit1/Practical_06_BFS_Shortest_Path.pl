% AIML Practical 6: BFS shortest path in an unweighted graph
% Sample query: ?- shortest_path(a, f, Path).
% BFS finds a shortest path when each edge has equal cost.

edge(a, b). edge(a, c).
edge(b, d). edge(b, e).
edge(c, f). edge(d, f).
edge(e, f).

adjacent(X, Y) :- edge(X, Y).
adjacent(X, Y) :- edge(Y, X).

shortest_path(Start, Goal, Path) :-
    bfs([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

bfs([[Goal|Rest]|_], Goal, [Goal|Rest]).
bfs([Path|Queue], Goal, Result) :-
    Path = [Current|_],
    findall([Next|Path],
        (adjacent(Current, Next), \\+ member(Next, Path)),
        NewPaths),
    append(Queue, NewPaths, Queue1),
    bfs(Queue1, Goal, Result).
