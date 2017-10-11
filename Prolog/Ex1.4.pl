n(red, yellow).
n(red, green).

n(green, red).
n(green, yellow).

n(yellow, green).
n(yellow, red).


colors(LU, ZG, NW, OW, SZ, UR) :-
SZ = red,
UR = yellow,
n(LU, ZG),
n(LU, SZ),
n(LU, NW),
n(LU, OW),
n(ZG, SZ),
n(SZ, NW),
n(SZ, UR),
n(UR, NW),
n(UR, OW),
n(NW, OW).

% colors(LU, ZG, NW, OW, SZ, UR).
% LU = UR, UR = yellow,
% ZG = NW, NW = green,
% OW = SZ, SZ = red.