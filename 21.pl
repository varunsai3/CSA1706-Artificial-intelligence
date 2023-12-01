% Define the predicate hanoi/3, where hanoi(N, A, B) means move N disks from tower A to tower B using an auxiliary tower.

% Base case: moving 0 disks requires no moves.
hanoi(0, _, _, _).

% Recursive case: move N disks from tower A to tower C using tower B as an auxiliary.
hanoi(N, A, B, C) :-
    N > 0,
    M is N - 1,
    hanoi(M, A, C, B),
    move_disk(N, A, C),
    hanoi(M, B, A, C).

% Predicate to print the move.
move_disk(N, From, To) :-
    write('Move disk '), write(N),
    write(' from '), write(From),
    write(' to '), write(To),
    nl.
