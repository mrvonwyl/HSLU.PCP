% all females
female(mary).
female(liz).
female(mia).
female(tina).
female(ann).
female(sue).

% all males
male(mike).
male(jack).
male(fred).
male(tom).
male(joe).
male(jim).

% all childern of mary
parent(mary, mia).
parent(mary, fred).
parent(mary, tina).

% all children of mike
parent(mike, mia).
parent(mike, fred).
parent(mike, tina).

% all childern of liz
parent(liz, tom).
parent(liz, joe).

% all childern of jack
parent(jack, tom).
parent(jack, joe).

% all childern of mia
parent(mia, ann).

% all childern of tina
parent(tina, sue).
parent(tina, jim).

% all childern of tom
parent(tom, sue).
parent(tom, jim).

% Ex a
mother(X, Y) :- female(X), parent(X, Y).
father(X, Y) :- male(X), parent(X, Y).

% mother(X, jim), father(X, jim)
% parent(mary, X)

% Ex b
sibling(X, Y) :- parent(Z, X), parent(Z, Y).

% sibling(mia, fred).

% Ex c
grandmother(X, Y) :- parent(Z, Y), mother(X, Z).

% grandmother(X, ann).
% grandmother(liz, X).

% Ex d
offspring(X, Y) :- parent(Y, X).
offspring(X, Y) :- parent(Z, X), offspring(Z, Y).

% offspring(ann, mary).
% offspring(sue, X).


% Lösung Aufgabe 5
% Präzedenz, Typ (Infix, Präfix, Postfix), Name
% op(1150, xfx, mother).
% op(1100, xfx, offspring).