% Ex a

add_tail(X, [], [X]).
add_tail(X, [H | T], [H | L]) :- add_tail(X, T, L).

% Ex b

del([], X, []).
del([X | T], X, L1) :- del(T, X, L1).
del([H | T], X, [H | L1]) :- del(T, X, L1).

% Ex c

% TODO: entweder X aus Liste löschen und wenn beide listen gleich, dann ist X nicht vorhanden
% oder alle elemente der Liste löschen, ausser X

mem_d(X, L) :- L = L1, del(L, X, L1).


% Ex d

%rev_acc(L, A, R) :- 

% Ex e

rev([X], [X]).
rev([LH | LT], R) :- rev(LT, R).
