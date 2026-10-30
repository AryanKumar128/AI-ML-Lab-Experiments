% AIML Practical 1: Student-Course Knowledge Base
% SWI-Prolog syntax. Run: swipl -s Practical_01_Knowledge_Base.pl
% Sample queries:
% ?- enrolled(aryan, aiml).
% ?- student(X).
% ?- enrolled(aryan, Course).

student(aryan).
student(riya).
student(aman).

course(aiml).
course(dsa).
course(python).

enrolled(aryan, aiml).
enrolled(aryan, dsa).
enrolled(riya, python).
enrolled(aman, aiml).

% Rule: a student studies a course if enrolled in it.
studies(Student, Course) :- enrolled(Student, Course).

% Rule: two students share a course if both are enrolled in the same course.
classmates_in_course(S1, S2, Course) :-
    enrolled(S1, Course),
    enrolled(S2, Course),
    S1 \= S2.
