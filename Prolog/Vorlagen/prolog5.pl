
% HSLU I, Modul PCP, ruedi.arnold@hslu.ch


snake(snake).
animal(snake).
animal(horse).
animal(dog).
animal(elephant).

likes(mary, X) :- snake(X),!, fail.
likes(mary, X) :- animal(X).

different(X, X) :- !, fail.
different(_X, _Y).

not(P) :- P, !, fail.
not(P) :- true. % variable name _P to avoid compiler warning "Singleton Variables"

singleton_test(_X) :- print(_X).

likes_with_not(mary, X) :-
	animal(X),
	not(snake(X)).

different_with_not(X, Y) :- not(X = Y).

round(ball).

notx(P) :- P, !, fail.
notx(_P) :- true.

great_food(creaBeck).
great_food(hug).
great_food(mac).
limited_seating(hug).
good_place(Restaurant) :- notx(limited_seating(Restaurant)).

convert(Celsius, Fahrenheit) :-
	Celsius is (Fahrenheit - 32)*5/9.

:- use_module(library(clpr)).

convert_clp(Celsius, Fahrenheit) :-
	{ Celsius = (Fahrenheit - 32)*5/9 }.

fib(0, 0).
fib(1, 1).
fib(N, F) :-
	N > 1,
	N1 is N - 1,
	N2 is N - 2,
	fib(N1, F1),fib(N2, F2),
	F is F1 + F2.

fib_clp(N, F) :- { N = 0, F = 0 }.
fib_clp(N, F) :- { N = 1, F = 1 }.
fib_clp(N, F) :-
	{ N >= 2, F = F1+F2, N1 = N-1, N2 = N-2 },
	fib_clp(N1, F1),
	fib_clp(N2, F2).

:- use_module(library(clpfd)).

send_more_money([S,E,N,D] + [M,O,R,E] = [M,O,N,E,Y]) :-
        Vars = [S,E,N,D,M,O,R,Y],
        Vars ins 0..9,
        all_distinct(Vars),
                  S*1000 + E*100 + N*10 + D +
                  M*1000 + O*100 + R*10 + E #=
        M*10000 + O*1000 + N*100 + E*10 + Y,
        M #\= 0, S #\= 0,
	label(Vars).

% send_more_money(As + Bs = Cs).
