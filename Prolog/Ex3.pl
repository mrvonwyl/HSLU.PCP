word(n,e,u).
word(t,o,p).
word(t,o,t).
word(b,r,o,t).
word(g,r,a,u).
word(h,a,l,t).
word(a,l,l,e).
word(j,e,t,z,t).
word(s,a,g,e,n).
word(u,n,t,e,n).
word(z,e,c,k,e).

solution(L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12) :-
word(L1, L3, L6, L8),
word(L5, L7, L10),
word(L2, L3, L4, L5),
word(L8, L9, L10, L11, L12).

% ?- solution(L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12).
% L1 = g,
% L2 = b,
% L3 = r,
% L4 = L7, L7 = o,
% L5 = L10, L10 = t,
% L6 = a,
% L8 = u,
% L9 = L12, L12 = n,
% L11 = e .