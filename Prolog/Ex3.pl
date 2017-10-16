:-use_module(library(http/json)).
:-use_module(library(http/http_client)).
:-use_module(library(http/json_convert)).
:- use_module(library(http/http_json)).
:-use_module(library(clpfd)).

% family

female(mary). female(liz). female(mia). female(tina). female(ann). female(sue). % all females
male(mike). male(jack). male(fred). male(tom). male(joe). male(jim).            % all males
parent(mary, mia). parent(mary, fred). parent(mary, tina).                      % all childern of mary
parent(mike, mia). parent(mike, fred). parent(mike, tina).                      % all children of mike
parent(liz, tom). parent(liz, joe).                                             % allchildern of liz
parent(jack, tom). parent(jack, joe).                                           % all childern of jack
parent(mia, ann).                                                               % all childern of mia
parent(tina, sue). parent(tina, jim).                                           % all childern of tina
parent(tom, sue). parent(tom, jim).                                             % all childern of tom

mother(X,Y) :- female(X), parent(X,Y).
father(X,Y) :- male(X), parent(X,Y).
sibling(X,Y) :-  parent(Z,X), parent(Z,Y).
grandmother(X,Y) :- mother(X,Z), parent(Z,Y).
grandfather(X, Y) :- father(X, Z), parent(Z, Y).
offspring(X,Y) :- parent(X, Y).
offspring(X,Y) :- parent(Z, X), parent(Y, Z).

% sudoku

sudoku(Rows) :-
    append(Rows, Vs), Vs ins 1..9,
    maplist(all_distinct, Rows),
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    Rows = [A, B, C, D, E, F, G, H, I],
    blocks(A, B, C), blocks(D, E, F), blocks(G, H, I),
    maplist(label, Rows).
blocks([], [], []).
blocks([A, B, C|Bs1], [D, E, F|Bs2], [G, H, I|Bs3]) :-
    all_distinct([A, B, C, D, E, F, G, H, I]),
    blocks(Bs1, Bs2, Bs3).

% solve

solve_relationship(Object, Result) :-
	Object = json([firstPerson=Y, problemKey=_, relationship=Rela, secondPerson=Z]),
	call(Rela,Y,Z),
	Result = true, !.
solve_relationship(_, Result) :- Result = false.

solve(P, PID) :-
    atom_concat('http://localhost:16316/problem/', P, URL),
    atom_concat(URL, /, URL1),
    atom_concat(URL1, PID, URL2),
    http_get(URL2, JSON, []),
    json_to_prolog(JSON, Object),
    atom_concat('solve_', P, Call),
	call(Call, Object, Result),
	JSONR = json([problemKey=ID, solution=Result]),
	http_post(L1, json(JSONR), _, []).


% Replace

replace_0([] , [] ).
replace_0([0 | L1], [_ | L2]) :- replace_0(L1, L2).
replace_0([X | L1], [X | L2]) :-
    X \= 0,
	replace_0(L1, L2).

solve_sudoku(Object, S_) :-
    Object = json([problemKey=_,sudoku= S0]),
    maplist(replace_0, S0, S_),
    S_ = [A, B, C, D, E, F, G, H, I],
    sudoku([A,B,C,D,E,F,G,H,I]).