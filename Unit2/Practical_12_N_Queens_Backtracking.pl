% AIML Practical 12: N-Queens using backtracking
% Sample queries: ?- n_queens(4, Positions).
% Positions list: queen in each column; value is its row.

n_queens(N, Positions) :-
    integer(N), N > 0,
    length(Positions, N),
    place_queens(Positions, N).

place_queens([], _).
place_queens([Row|Rest], N) :-
    between(1, N, Row),
    place_queens(Rest, N),
    safe_queen(Row, Rest, 1).

safe_queen(_, [], _).
safe_queen(Row, [OtherRow|Rest], Distance) :-
    Row =\\= OtherRow,
    abs(Row - OtherRow) =\\= Distance,
    D1 is Distance + 1,
    safe_queen(Row, Rest, D1).
