
io_fib() :-
	write('Gib eine Zahl ein: '),
	read(Y),
	fib_tr(Y, X),
	string_concat('Die ', Y, A),
	string_concat(A, '. Fibonacci-Zahl ist ', B),
	string_concat(B, X, C),
	write(C).



fib_tr(N, F) :- fib_tr(N, 0, 1, F).
fib_tr(0, A, _, A).
fib_tr(N, A, B, F) :-
	N1 is N - 1,
	N1 >= 0,
	Sum is A + B,
	fib_tr(N1, B, Sum, F).