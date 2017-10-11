warn(T) :- T < 80, write('Temperatur ok').
warn(T) :- T >= 80, T < 100, write('Temperatur sehr warm').
warn(T) :- T >= 100, write('Temperatur zu heiss').

% Der Unterschied ist, dass ohne CUT je nach wert mehrere Prädikate zutreffen. Bsp: T = 30.
% Um dies zu verhindern, dürfen die Prädikate nur in einem bestimmten Bereich zutreffen.