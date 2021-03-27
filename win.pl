% compute opponent
opponent(x, o).
opponent(o, x).

% update board state
mark([a|T], [Player|T], Player, 1, 1).
mark([A, a|T], [A, Player|T], Player, 1, 2).
mark([A, B, a|T], [A, B, Player|T], Player, 1, 3).
mark([A, B, C, a|T], [A, B, C, Player|T], Player, 2, 1).
mark([A, B, C, D, a|T], [A, B, C, D, Player|T], Player, 2, 2).
mark([A, B, C, D, E, a|T], [A, B, C, D, E, Player|T], Player, 2, 3).
mark([A, B, C, D, E, F, a|T], [A, B, C, D, E, F, Player|T], Player, 3, 1).
mark([A, B, C, D, E, F, G, a|T], [A, B, C, D, E, F, G, Player|T], Player, 3, 2).
mark([A, B, C, D, E, F, G, H, a], [A, B, C, D, E, F, G, H, Player], Player, 3, 3).

% extract available positions
% mark([a, a, a, a, o, a, a, a, a], _, x, X, Y).
% extract occupied positions
% mark(_, [a, a, a, a, o, a, a, a, a], o, X, Y).

win(Board, Player) :-
    mark(_, Board, Player, X, I),
    mark(_, Board, Player, X, J),
    mark(_, Board, Player, X, K),
    J is I + 1,
    K is J + 1.

% define winning board state
win(Board, Player) :-
    mark(_, Board, Player, I, Y),
    mark(_, Board, Player, J, Y),
    mark(_, Board, Player, K, Y),
    J is I + 1,
    K is J + 1.

win(Board, Player) :-
    mark(_, Board, Player, 1, 1),
    mark(_, Board, Player, 2, 2),
    mark(_, Board, Player, 3, 3).

win(Board, Player) :-
    mark(_, Board, Player, 1, 3),
    mark(_, Board, Player, 2, 2),
    mark(_, Board, Player, 3, 1).

% extract winning move
% win(B, x), mark([x, x, a, a, x, a, x, o, a], B, x, X, Y).
% this example produces two instance of an (x, y) pair amongst other pairs
% since this pair causes both a diagnal and row win

% force_win(P, X, Y) :- 
%     mark(P, C, x, X, Y),
%     win(C, x).

% force_win(P, X, Y) :-
%     mark(P, C, x, X, Y),
%     mark(C, N, o, _, _),
%     force_win(N, _, _).

% symmetry optimization
% define board equality
% memoization