%Aufgabe 4
%
%
:- use_module(library(http/http_client)).
:- use_module(library(clpfd)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/json)).
:- use_module(library(http/http_json)).

:- json_object
        relationship(firstPerson:atom, problemKey:integer, relationship:atom, secondPerson:atom),
	sudoku(problemKey:integer, sudoku:list),
	% Switch to boolean when server is fixed
	solution(solution:atomic,problemKey:integer),
	sudoku_solution(problemKey:integer, solution:list).

% --------------------------------------------------------------------------------
% Relationship%
%

female(mary). female(liz). female(mia). female(tina). female(ann). female(sue).% all females

male(mike). male(jack). male(fred). male(tom). male(joe). male(jim). % all males

%parent, child

parent(mary, mia). parent(mary, fred). parent(mary, tina). % all childern of mary
parent(mike, mia). parent(mike, fred). parent(mike, tina). % all children of mike
parent(liz, tom). parent(liz, joe).                        % allchildern of liz
parent(jack, tom). parent(jack, joe).                      % all childern of jack
parent(mia, ann).                                          % all childern of mia
parent(tina, sue). parent(tina, jim).                      % all childern of tina
parent(tom, sue). parent(tom, jim).                        % all childern of tom

mother(X,Y) :- female(X), parent(X,Y).                    %Mother, Child
father(X,Y) :- male(X), parent(X,Y).                      %Father, Child

sibling(X,Y) :- parent(Z,Y), parent(Z,X).

grandmother(X,Y) :-  mother(X,Z), parent(Z,Y).            %grandmother, Grandchild

offspring(X,Y) :- parent(Y,X).                            %Grandchild, Grandmother
offspring(X,Y) :- parent(Z,X), offspring(Z,Y).


% --------------------------------------------------------------------------------
% Sudoku%
%
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

% --------------------------------------------------------------------------------
% Problemsolver%
%

solve(relationship,Id) :-
              atom_concat('http://localhost:16316/problem/relationship/',Id, Link),
              http_get(Link,Reply,[]),
              json_to_prolog(Reply, relationship(FirstPerson, _Problemkey, Relationship, SecondPerson)),
              %json_to_prolog(Reply,Object),
              %Object = json([firstPerson=FName,problemKey=_,relationship=Relationship,secondPerson=SName]),
              %Object = json([firstPerson=FirstPerson, problemKey=_,relationship=Relationship,secondPerson=SecondPerson]),
              call(Relationship,FirstPerson,SecondPerson),
              prolog_to_json(solution(true,Id),JsonResult),
              http_post('http://localhost:16316/problem/relationship',json(JsonResult),_SolutionResponse,[]),!.


solve(relationship,Id) :-
             prolog_to_json(solution(false,Id), JsonResult),
%            write(JsonRes),
             http_post('http://localhost:16316/problem/relationship',json(JsonResult),_,[]).
%            write(finish).

solve(sudoku, Id) :-
              atom_concat('http://localhost:16316/problem/sudoku/',Id, Link),
              http_get(Link,Reply,[]),
              json_to_prolog(Reply,sudoku(_Problemkey,Sudoku_0)),
              maplist(replace_0, Sudoku_0, Sudoku),
              Sudoku = [A, B, C, D, E, F, G, H, I],
              sudoku([A, B, C, D, E, F, G, H, I]),
              prolog_to_json(sudoku_solution(Id, Sudoku), JsonPost),
              http_post('http://localhost:16316/problem/sudoku', json(JsonPost), _,[]).


replace_0(L1, L2) :-
	      maplist(replace_help, L1, L2),
	      !.
replace_help(0, _).
replace_help(X, X).

