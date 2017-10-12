

% Ex a
:- dynamic faki/2.
fak(0, 1).

fak_as(N, F) :-
    faki(N, F),
    string_concat('(Hinweis: Fakultät von ', N, A),
    string_concat(A, ' war gespeichert)', B),
    write(B).


fak(N, F) :- fak_as(N, F).
fak(N, F) :-
    N > 0,
	N1 is N - 1,
	fak(N1, F1),
	F is N * F1,
    asserta(faki(N, F)).

% Ex b

fak_clear :-
    retractall(faki(_, _)),
    write('(Hinweis: Alle gespeicherten Werte wurden gelöscht)').
