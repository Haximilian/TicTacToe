:- use_module(library(clpfd)).

% board domain
point(1, 1).
point(1, 2).
point(1, 3).
point(2, 1).
point(2, 2).
point(2, 3).
point(3, 1).
point(3, 2).
point(3, 3).

% compute board state
mark([a, _, _, _, _, _, _, _, _], [Player, _, _, _, _, _, _, _, _], Player, 1, 1).
mark([_, a, _, _, _, _, _, _, _], [_, Player, _, _, _, _, _, _, _], Player, 1, 2).
mark([_, _, a, _, _, _, _, _, _], [_, _, Player, _, _, _, _, _, _], Player, 1, 3).
mark([_, _, _, a, _, _, _, _, _], [_, _, _, Player, _, _, _, _, _], Player, 2, 1).
mark([_, _, _, _, a, _, _, _, _], [_, _, _, _, Player, _, _, _, _], Player, 2, 2).
mark([_, _, _, _, _, a, _, _, _], [_, _, _, _, _, Player, _, _, _], Player, 2, 3).
mark([_, _, _, _, _, _, a, _, _], [_, _, _, _, _, _, Player, _, _], Player, 3, 1).
mark([_, _, _, _, _, _, _, a, _], [_, _, _, _, _, _, _, Player, _], Player, 3, 2).
mark([_, _, _, _, _, _, _, _, a], [_, _, _, _, _, _, _, _, Player], Player, 3, 3).

