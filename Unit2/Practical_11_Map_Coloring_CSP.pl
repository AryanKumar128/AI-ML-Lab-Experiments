% AIML Practical 11: Map Coloring as a CSP with backtracking
% Sample query: ?- color_map(Colors).

region(a). region(b). region(c). region(d).
adjacent(a,b). adjacent(a,c). adjacent(b,c).
adjacent(b,d). adjacent(c,d).

color(red). color(green). color(blue).

different_colors(X, Y, Assignments) :-
    member(X-CX, Assignments), member(Y-CY, Assignments), CX \\= CY.

valid_assignment(Region, Color, Assignments) :-
    forall((adjacent(Region, Other); adjacent(Other, Region)),
           ( \\+ member(Other-_, Assignments)
           ; different_colors(Region, Other, [Region-Color|Assignments])
           )).

color_map(Assignments) :-
    assign_regions([a,b,c,d], [], Assignments).

assign_regions([], A, A).
assign_regions([R|Rest], Partial, Result) :-
    color(C),
    valid_assignment(R, C, Partial),
    assign_regions(Rest, [R-C|Partial], Result).
