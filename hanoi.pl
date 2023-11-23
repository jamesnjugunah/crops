% Define the Tower of Hanoi predicate
hanoi(1, A, _, C, Moves) :-
    append(A, [1], Temp),
    append(C, [1], TempC),
    write_moves(A, TempC, Moves).

hanoi(N, A, B, C, Moves) :-
    N > 1,
    M is N - 1,
    hanoi(M, A, C, B, Moves1),
    append(A, [N], Temp),
    append(B, [N], TempB),
    append(C, [N], TempC),
    write_moves(A, TempB, Moves2),
    hanoi(M, C, B, A, Moves3),
    append(Moves1, Moves2, TempMoves),
    append(TempMoves, Moves3, Moves).

% Write moves to the output
write_moves(From, To, Moves) :-
    write('Move from '), write(From), write(' to '), write(To), nl,
    Moves = [move(From, To)].

% Example usage:
% To solve Tower of Hanoi with 3 disks, call hanoi(3, [], [], [], Moves).
