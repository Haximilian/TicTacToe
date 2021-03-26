:- use_module(library(clpfd)).

% define the domain of the board
point(1, 1).
point(1, 2).
point(1, 3).
point(2, 1).
point(2, 2).
point(2, 3).
point(3, 1).
point(3, 2).
point(3, 3).

% initialize the board
:- asserta(status(available, point(1, 1))).
:- asserta(status(available, point(1, 2))).
:- asserta(status(available, point(1, 3))).
:- asserta(status(available, point(2, 1))).
:- asserta(status(available, point(2, 2))).
:- asserta(status(available, point(2, 3))).
:- asserta(status(available, point(3, 1))).
:- asserta(status(available, point(3, 2))).
:- asserta(status(available, point(3, 3))).

play(State, point(X, Y)) :-
    retract(status(available, point(X, Y))),
    asserta(status(State, point(X, Y))).

diagnal(point(XOne, YOne), point(XTwo, YTwo)) :- 
    XOne #= XTwo + 1,
    YOne #= YTwo + 1.

diagnal(point(XOne, YOne), point(XTwo, YTwo)) :- 
    XOne #= XTwo - 1,
    YOne #= YTwo - 1.

% win(First, Second, Third) :- win(First, Third, Second).
% win(First, Second, Third) :- win(Second, First, Third).

win(First, Second, Third) :- 
    diagnal(First, Second),
    diagnal(Second, Third),
    dif(First, Second),
    dif(Second, Third),
    dif(First, Third).
