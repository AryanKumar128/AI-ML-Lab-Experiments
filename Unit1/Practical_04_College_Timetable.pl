% AIML Practical 4: College Timetable Knowledge Base
% Sample queries:
% ?- faculty_subject(Dr_Sharma, Subject).
% ?- class_in_room(Room, Day, Slot).
% ?- timetable(Day, Slot, Faculty, Subject, Room).

% timetable(Day, Slot, Faculty, Subject, Room).
timetable(monday, 1, dr_sharma, aiml, room_101).
timetable(monday, 2, prof_verma, dsa, room_102).
timetable(tuesday, 1, dr_sharma, python, lab_1).
timetable(tuesday, 2, prof_singh, mathematics, room_201).
timetable(wednesday, 1, prof_verma, dsa, lab_2).
timetable(thursday, 3, prof_singh, mathematics, room_201).
timetable(friday, 2, dr_sharma, aiml, room_101).

faculty_subject(Faculty, Subject) :-
    timetable(_, _, Faculty, Subject, _).

class_in_room(Room, Day, Slot) :-
    timetable(Day, Slot, _, _, Room).

faculty_teaches_on(Faculty, Day, Subject) :-
    timetable(Day, _, Faculty, Subject, _).

subject_in_room(Subject, Room) :-
    timetable(_, _, _, Subject, Room).
