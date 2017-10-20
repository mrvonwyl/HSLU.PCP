set_difference([], _, []).
 
set_difference([H1 | T1], S2, SD) :-
    member(H1, S2),
	set_difference(T1, S2, SD).
 
set_difference([H1 | T1], S2, [H1 | SD]) :-
    not(member(H1, S2)), 
    set_difference(T1, S2, SD).