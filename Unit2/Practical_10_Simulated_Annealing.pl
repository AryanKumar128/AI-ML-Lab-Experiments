% AIML Practical 10: Simulated Annealing (maximize f(x))
% A random uphill/downhill move may be accepted according to exp((new-old)/T).
% Uses SWI-Prolog library(random). Sample query: ?- simulated_annealing(0, 100, X, V).

:- use_module(library(random)).

value(X, V) :- V is -((X - 3) * (X - 3)) + 9.

simulated_annealing(Start, Steps, BestX, BestV) :-
    value(Start, V),
    anneal(0, Steps, Start, V, Start, V, BestX, BestV).

anneal(I, Steps, X, V, BX, BV, BestX, BestV) :-
    ( I >= Steps ->
        BestX = BX, BestV = BV
    ; T is max(0.05, 10.0 * (Steps-I) / Steps),
      random_between(-2, 2, Delta),
      NX is X + Delta,
      value(NX, NV),
      ( NV >= V -> Accept = true
      ; Prob is exp((NV-V)/T),
        random(R), (R < Prob -> Accept = true ; Accept = false)
      ),
      ( Accept == true -> AX=NX, AV=NV ; AX=X, AV=V ),
      ( AV > BV -> NBX=AX, NBV=AV ; NBX=BX, NBV=BV ),
      I1 is I+1,
      anneal(I1, Steps, AX, AV, NBX, NBV, BestX, BestV)
    ).
