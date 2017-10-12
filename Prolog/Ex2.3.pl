% Ex a

add_tail(X, [], [X]).
add_tail(X, [H | T], [H | L]) :- add_tail(X, T, L).

% Ex b

del([], X, []).
del([X | T], X, L) :- del(T, X, L).
del([H | T], X, [H | L]) :- del(T, X, L).

% Ex c

mem_d(X, L) :- del(L, X, _).


% Ex d

rev_acc([H | T], A, R) :- rev_acc(T, [H | A], R).
rev_acc([], A, A). 

% Ex e

rev([X], [X]).
rev([LH | LT], R) :- rev(LT, R).
