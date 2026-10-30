% AIML Practical 5: Classify students using rule-based reasoning
% Marks are out of 100. Change thresholds if your teacher specifies different rules.
% Sample query: ?- performance(aryan, Category).

marks(aryan, 92).
marks(riya, 68).
marks(aman, 31).
marks(neha, 84).

performance(Student, topper) :-
    marks(Student, M), M >= 85.
performance(Student, average) :-
    marks(Student, M), M >= 40, M < 85.
performance(Student, fail) :-
    marks(Student, M), M < 40.

show_result(Student, Marks, Category) :-
    marks(Student, Marks),
    performance(Student, Category).
