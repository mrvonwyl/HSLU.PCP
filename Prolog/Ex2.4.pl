p(X) :- a(X).
p(X) :- b(X), !, c(X).
p(X) :- d(X).
a(1).
b(2).
b(3).
c(2).
c(3).
d(4).



u(1).
u(X) :- v(X).
u(2).
v(_X) :- !, write("CUT").