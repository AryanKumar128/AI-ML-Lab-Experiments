% AIML Practical 9: Hill Climbing for numerical optimization
% Example objective: maximize f(x) = -(x-3)^2 + 9, whose maximum is at x=3.
% Sample query: ?- hill_climb(0, BestX, BestValue).

value(X, V) :- V is -((X - 3) * (X - 3)) + 9.

hill_climb(Start, BestX, BestValue) :-
    value(Start, StartValue),
    climb(Start, StartValue, BestX, BestValue).

climb(X, V, BestX, BestV) :-
    Left is X - 1, Right is X + 1,
    value(Left, LV), value(Right, RV),
    ( LV > V -> climb(Left, LV, BestX, BestV)
    ; RV > V -> climb(Right, RV, BestX, BestV)
    ; BestX = X, BestV = V
    ).
