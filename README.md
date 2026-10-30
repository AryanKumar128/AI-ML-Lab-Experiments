# Introduction to AIML — Unit 1 & Unit 2 Practicals

This pack contains separate Prolog source files for Practical 1–12 from the uploaded spreadsheet.

## Important compatibility note
The sheet mentions **Visual Prolog** for these practicals. The code in this pack uses **SWI-Prolog syntax** (a free, beginner-friendly Prolog implementation), so it will not run unchanged in Visual Prolog because their syntax differs.

## How to run
1. Install SWI-Prolog from https://www.swi-prolog.org/
2. Open SWI-Prolog.
3. Load a practical file, for example:
   `?- [ 'Unit1/Practical_01_Knowledge_Base.pl' ].`
   Or run from a terminal: `swipl -s "Unit1/Practical_01_Knowledge_Base.pl"`
4. Type one of the sample queries written in the comments at the top of the file. Queries end with a period (`.`).

## Unit 1 — Introduction to AI and Intelligent Agents
1. Knowledge Base — facts, rules and queries.
2. Arithmetic, factorial and Fibonacci — recursion.
3. List operations — append, reverse, member search and length.
4. College timetable — query faculty, subjects and rooms.
5. Student performance — rule-based classification.
6. BFS — shortest path in an unweighted graph.

## Unit 2 — Problem Solving and Searching
7. Greedy Best-First Search — chooses based on heuristic h(n); not guaranteed optimal.
8. A* Search — combines path cost g(n) and heuristic h(n).
9. Hill Climbing — improves a numerical objective using neighboring states.
10. Simulated Annealing — sometimes accepts worse states to escape local optima; result can vary due to randomness.
11. Map Coloring — CSP solved with backtracking.
12. N-Queens — CSP/backtracking; each queen must be in a distinct row and diagonal.

## Sample queries
- Practical 1: `?- enrolled(aryan, aiml).`
- Practical 2: `?- factorial(5, F).` and `?- fibonacci(7, L).`
- Practical 3: `?- reverse_list([1,2,3], R).`
- Practical 4: `?- timetable(monday, Slot, Faculty, Subject, Room).`
- Practical 5: `?- performance(aryan, Category).`
- Practical 6: `?- shortest_path(a, f, Path).`
- Practical 7: `?- greedy_best_first(s, g, Path).`
- Practical 8: `?- a_star(s, g, Path, Cost).`
- Practical 9: `?- hill_climb(0, X, Value).`
- Practical 10: `?- simulated_annealing(0, 100, X, Value).`
- Practical 11: `?- color_map(Colors).`
- Practical 12: `?- n_queens(4, Positions).`

## Viva quick notes
- **Fact:** a statement stored directly in the knowledge base, e.g. `student(aryan).`
- **Rule:** a conclusion derived from conditions, e.g. `studies(S,C) :- enrolled(S,C).`
- **Goal/query:** a question asked to Prolog, e.g. `?- student(X).`
- **Recursion:** a predicate calls itself with a smaller/simpler input.
- **BFS:** explores level by level and finds a shortest path in an unweighted graph.
- **Greedy Best-First:** chooses the node with the lowest heuristic value h(n).
- **A\*:** evaluates f(n) = g(n) + h(n).
- **Hill Climbing:** moves to a better neighboring state; may get stuck at a local optimum.
- **Simulated Annealing:** probabilistically accepts some worse moves, especially at higher temperature.
- **CSP:** a problem defined by variables, domains and constraints.
- **Backtracking:** tries a choice; if it violates constraints or leads to failure, it returns and tries another choice.

These are educational examples with small sample data. Adjust names, graph edges, marks, rooms, or thresholds if your instructor has supplied specific values.
