:- use_module(library(clpfd)).

% update board state
mark([a, _, _, _, _, _, _, _, _], [Player, _, _, _, _, _, _, _, _], Player, 1, 1).
mark([_, a, _, _, _, _, _, _, _], [_, Player, _, _, _, _, _, _, _], Player, 1, 2).
mark([_, _, a, _, _, _, _, _, _], [_, _, Player, _, _, _, _, _, _], Player, 1, 3).
mark([_, _, _, a, _, _, _, _, _], [_, _, _, Player, _, _, _, _, _], Player, 2, 1).
mark([_, _, _, _, a, _, _, _, _], [_, _, _, _, Player, _, _, _, _], Player, 2, 2).
mark([_, _, _, _, _, a, _, _, _], [_, _, _, _, _, Player, _, _, _], Player, 2, 3).
mark([_, _, _, _, _, _, a, _, _], [_, _, _, _, _, _, Player, _, _], Player, 3, 1).
mark([_, _, _, _, _, _, _, a, _], [_, _, _, _, _, _, _, Player, _], Player, 3, 2).
mark([_, _, _, _, _, _, _, _, a], [_, _, _, _, _, _, _, _, Player], Player, 3, 3).

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