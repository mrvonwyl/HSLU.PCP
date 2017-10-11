% Der CUT Operator im ersten Prädikat verhindert das Backtracking, und somit die Suche nach weiteren Lösungen.

mem(X, [X | _]) :- !.
mem(X, [_| Tail]) :- mem(X, Tail).

% L = [_, _, _], mem(a, L), mem(b, L), mem(c, L).