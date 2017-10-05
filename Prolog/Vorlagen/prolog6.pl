﻿
% HSLU I, Modul PCP, ruedi.arnold@hslu.ch

:- use_module(library(clpfd)).

sudoku(Rows) :-
  append(Rows, Vs), Vs ins 1..9,
  maplist(all_distinct, Rows),
  transpose(Rows, Columns),
  maplist(all_distinct, Columns),
  Rows = [A,B,C,D,E,F,G,H,I],
  blocks(A, B, C), blocks(D, E, F), blocks(G, H, I),
  maplist(label, Rows).

blocks([], [], []).
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
  all_distinct([A,B,C,D,E,F,G,H,I]),
  blocks(Bs1, Bs2, Bs3).


/*
Puzzle = [
   [5,3,_,_,7,_,_,_,_],
   [6,_,_,1,9,5,_,_,_],
   [_,9,8,_,_,_,_,6,_],
   [8,_,_,_,6,_,_,_,3],
   [4,_,_,8,_,3,_,_,1],
   [7,_,_,_,2,_,_,_,6],
   [_,6,_,_,_,_,2,8,_],
   [_,_,_,4,1,9,_,_,5],
   [_,_,_,_,8,_,_,7,9]
   ],
   Puzzle = [A,B,C,D,E,F,G,H,I],
   sudoku([A,B,C,D,E,F,G,H,I]).

Puzzle = [
   [8,_,_,_,_,_,_,_,_],
   [_,_,3,6,_,_,_,_,_],
   [_,7,_,_,9,_,2,_,_],
   [_,5,_,_,_,7,_,_,_],
   [_,_,_,_,4,5,7,_,_],
   [_,_,_,1,_,_,_,3,_],
   [_,_,1,_,_,_,_,6,8],
   [_,_,8,5,_,_,_,1,_],
   [_,9,_,_,_,_,4,_,_]
   ],
   Puzzle = [A,B,C,D,E,F,G,H,I],
   sudoku([A,B,C,D,E,F,G,H,I]).
*/
