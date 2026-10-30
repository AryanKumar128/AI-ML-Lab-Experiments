% AIML Practical 2: Arithmetic, factorial and Fibonacci
% Sample queries:
% ?- add(10, 5, R).
% ?- factorial(5, F).
% ?- fibonacci(7, List).

add(A, B, R) :- R is A + B.
subtract(A, B, R) :- R is A - B.
multiply(A, B, R) :- R is A * B.
divide(A, B, R) :- B =\= 0, R is A / B.

factorial(0, 1).
factorial(N, F) :-
    integer(N), N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

% fibonacci(N, List) returns the first N Fibonacci numbers, starting 0, 1.
fibonacci(N, List) :-
    integer(N), N >= 0,
    fib_list(N, 0, 1, List).

fib_list(0, _, _, []).
fib_list(N, A, B, [A|Rest]) :-
    N > 0,
    N1 is N - 1,
    C is A + B,
    fib_list(N1, B, C, Rest).
