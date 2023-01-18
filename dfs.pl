%q1
edge(0,1,5).
edge(0,6,11).
edge(1,2,7).
edge(1,5,5).
edge(1,6,3).
edge(1,7,6).
edge(2,3,-8).
edge(2,5,-1).
edge(3,4,10).
edge(3,5,9).
edge(4,5,1).
edge(5,6,2).
edge(6,7,9).

connected(X,Y,C) :- edge(X,Y,C);edge(Y,X,C).

%dfs
dfs_travel(S,G,P,[G|P],Cost) :- connected(S,G,Cost).
dfs_travel(S,G,Visited,Path,Cost) :- connected(S,N,D),N \== G,not(member(N,Visited)), dfs_travel(N,G,[N|Visited],Path,L1), Cost is D+L1.

dfs(S,G,Path,Cost) :- dfs_travel(S,G,[S],Q,Cost), reverse(Q,Path).
% use query for all possible dfs : ?- dfs(0,4,P,Cost).

% for minimal cost path
minimal_cost([S|D],M) :- min(D,S,M).
min([],M,M).
min([[P,L]|R],[_,M],M1) :- L<M,!,min(R,[P,L],M1).
min([_|R],M,M1) :- min(R,M,M1).

dfs_shortest(A,B,Path,Cost) :- setof([P,C],dfs(A,B,P,C),Set),Set = [_|_],minimal_cost(Set,[Path,Cost]).
% use query for dfs with shortest cost : ?- dfs_shortest(0,4,P,Cost).
