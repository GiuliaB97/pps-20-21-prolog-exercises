%Exercises about the PROLOG building blocks




%LIST

% search(Elem, List) -> Member
%test: Yes: search(3, [4,5 ,2, 3, 5]). 		No:search(32, [4,5 ,2, 3, 5]).
search(E, [E| _]):-!.
search(E, [_|T]):- search(E, T).

% search2Consecutive(Elem, List)
%test: Yes: search2Consecutive(3, [4,5 ,2, 3,3, 5]).		No search2Consecutive(3, [4,5 ,2, 3,9, 3, 5]).
search2Consecutive(E, [E, E| _]).									%cannot add cut->it will not find the second E
search2Consecutive(E, [_|T]):- search2Consecutive(E, T), !.

% search2AnyElemBetween(Elem, List)
%test: Yes search2AnyElemBetween(3, [4,5 ,2, 3,0, 3, 5]).	No: search2AnyElemBetween(3, [4,5 ,2, 3, 3, 5]).
search2AnyElemBetween(E, [E, _,E| _]).
search2AnyElemBetween(E, [_|T]):- search2AnyElemBetween(E, T), !.

% search2Occurence(Elem, List)
%test: Yes: search2Occurence(3, [4,5 ,2, 3,9, 3, 5]). 		No: search2Occurence(3, [4,5 ,2, 3,9, 3, 5]).
search2Occurence(E, [E| T]):- search(E, T).
search2Occurence(E, [_|T]):- search2Occurence(E, T), !.

%size(List, Size)
%test: Yes: size([1,2], 2).		No: size([1,2], 5).
size([], 0).
size([H|T], N):- M2 is N-1, size(T, M2).	%size([H|T], N):- size(T, M2), N is M2+1.

%sizeZero(List, Size)
%test: Yes sizeZero([1,2], s(s(zero))).		No: sizeZero([1,2], s(zero)).
sizeZero([], zero).
sizeZero([H|T], s(N)):- sizeZero(T, N).

%sum(List, Sum)
%test: Yes: sum([1,2], 3).		No:  sum([1,2], 6).
sum([], 0).
sum([H|T], N):- M2 is N-H, sum(T, M2).		%sum([H|T], N):- sum(T, M2), N is H+ M2.

%max(List, Max)
%test: Yes: max([1,2, 0], 2).		No:  sum([1,2, 0], 1).
max([], 0).
max([H|T], Max):- max(T, TailMax), H>TailMax, Max is H, !.
max([H|T], Max):- max(T,TailMax), H=<TailMax, Max is TailMax, !.

% maxMin(List,Max,Min)
%test: Yes: maxMin([1,2, 9, 0], 9, 0). 		No:maxMin([1,2, 9, 0], 3, 0).

maxMin([], 0, 0).
maxMin([H|T], Max, Min):- maxMin(T, TailMax, TailMin), H>TailMax, H=<TailMin, Max is H, Min is H, !.
maxMin([H|T], Max, Min):- maxMin(T, TailMax, TailMin), H=<TailMax, H=<TailMin, Max is TailMax, Min is H, !.
maxMin([H|T], Max, Min):- maxMin(T, TailMax, TailMin), H=<TailMax, H>TailMin, Max is TailMax, Min is TailMin, !.
maxMin([H|T], Max, Min):- maxMin(T, TailMax, TailMin), H>TailMax, H>TailMin, Max is H, Min is TailMin, !.

% same(List1,List2)
%test: Yes:same([1, 2], [1,2]).		No: same([1, 2], [0,1,2]).
same([E], [E]).
same([H|T1], [H|T2]):-same(T1, T2).

%allBigger(L, L).
%test: Yes:allBigger([11, 22, 33], [0,1,2]).	 No:allBigger([11,0, 22, 33], [0,1,2]).
allBigger([E1], [E2]):-E1>E2.
allBigger([H1|T1], [H2|T2]):-H1>H2,allBigger(T1, T2).

% sublist(List1,List2)
%test: YEs: sublist([1,2,3,4],[2,3]).		No: sublist([1,2,3,4],[2,3, 5]).
sublist([_], []).
sublist([H1|T1], [H1|T2]):-sublist(T1, T2).
sublist([H1|T1], [H2|T2]):-sublist(T1, [H2|T2]), !.					%cut: useful if the first List is longer of the second

% seq(N,List)
%test: Yes: seq(2, [0,0]). 	No: seq(2, [0,0,0]).
seq(0, []).
seq(N, [0|T]):- N2 is N-1, seq(N2, T).		%seq(N, [0|T]):- seq(N2, T), N is N2 +1.

% seqR(N,List)
% test: Yes: seqR(3,[3,2,1,0])		seqR(3, [3,2,1]
seqR(0, [_]).
seqR(N, [N|T]):- N2 is N-1, seqR(N2, T).	%seqR(N, [N|T]):- seqR(N2, T), N is N2+1, !.

% seqL(N,List)
% test: Yes: seqL(3,[0,1,2,3])		seqL(3, [1, 2,3]).
seqL(0, [_]).
seqL(N, [H1, H2|T]):-H1<H2, N2 is N-1, seqL(N2, [H2|T]). 	%seqL(N, [H1, H2|T]):-seqL(N2, [H2|T]), H1<H2, N is N2+1.

% dropAny(Elem,List,OutList)
%test: Yes: dropAny(3,[0,1,2,3,7], [0,1,2,7]).		No: dropAny( 3,[0,1,2,3,7], [0,1,2,3,7]).
dropAny(E, [E|T], T).
dropAny(E, [H|T1], [H|T2]):- dropAny(E, T1, T2), !.

% dropFirst(Elem,List,OutList)
%test: Yes: dropFirst( 3,[0,1,2,3,7,3], [0,1,2,7,3]).		No: dropFirst( 3,[0,1,2,3,7,3], [0,1,2,3,7,3]).
dropFirst(E, [E|T], T):-!.
dropFirst(E, [H|T1], [H|T2]):- dropFirst(E, T1, T2).

% dropLast(Elem,List,OutList)
%test: Yes: dropLast( 3,[0,1,2,3,7,3], [0,1,2,3,7]).		No: dropLast( 3,[0,1,2,3,7,3], [0,1,2,3,7,3]).
dropLast(E, [H|T1], [H|T2]):- dropLast(E, T1, T2).
dropLast(E, [E|T], T).

% dropAll(Elem,List,OutList)
dropAll(E, [E|T1], L):- dropAll(E, T1, L).
dropAll(E, [H|T1], [H|T2]):- dropAll(E, T1, T2).
dropAll(E, [E|T], T).

%double
%test: yes double([0, 1],[0,1,0,1]).	double([0, 1, 5],[0,1,5, 0,1, 5]).		no: double([0, 1],[0,1,8, 0,1]).	double([0, 1, 5],[0,1,0,1]).
double(L, OL):- append(L, L, OL).

%times
%test: times([0], 3, [0,0,0]). 	No: times([0], 2, [0,0,0]).
times(_, 0, []).
times(L, N1, R1) :- N1 > 0, N2 is N1-1, times(L, N2, R2), append(L, R2, R1).
%listFirsts
%test: listsFirst([[a,c,d],[b]],[a,b])
listsFirst([], []).
listsFirst([[First|_]|Xs], [First|Ys]) :- listsFirst(Xs, Ys).

%reverse
%test: Yes: reverse([1,2, 3, 4],[4, 3,2,1]). No: reverse([1,2, 3, 4],[4, 2,1]).
reverse(L, OL):- reverseAccumulator(L, [],OL).

reverseAccumulator([H|T], A, OL):- reverseAccumulator(T, [H|A], OL).
reverseAccumulator([H|T],A,A).





%GRAPH

%fromList(List, Graph)
%test Yes: fromList([10,20,30],[e(10,20),e(20,30)]).
fromList([_],[]).
fromList([H1, H2|T1], [e(H1, H2)|T2]):-fromList([H2|T1],T2).

%fromCircList(List, Graph)
%test: Yes: fromCircList([10,20,30],[e(10,20),e(20,30),e(30,10)]).
fromCircList([H|T], G):-
	append([H|T], [H], L),
	fromList(L, G).

% dropNode(+Graph, +Node, -OutGraph); drop all edges starting and leaving from a Node
%test dropNode([e(1,2),e(1,3),e(2,3)],1,[e(2,3)]).
dropNode(Graph, Node, OutGraph):-
	dropAll(Graph, e(N, _), TmpOutGraph),
	dropAll(TmpOutGraph, e(_, Node),OutGraph).

% reaching(+Graph, +Node, -SuccessorList); all the nodes that can be reached in 1 step
%test: reaching([e(1,2),e(1,2),e(2,3)],1,[2,2]).
reaching(Graph,Node,SuccessorList):-
	findall(Successor, search(e(Node,Successor),Graph), SuccessorList).

% anypath(+Graph, +Node1, +Node2, -ListPath) a path from Node1 to Node2 if there are many path, they are showed 1-by-1
%test: anypath([e(1,2),e(1,3),e(2,3)],1,3,[e(1,2),e(2,3)]).
anypath(G,N1,N2,[e(N1,N2)]):- search(e(N1,N2),G),!.                           %– a path from N1 to N2 exists if there is a e(N1,N2)
anypath(G,N1,N2,[e(N1,N3)|T]):- search(e(N1,N3),G),                     %– a path from N1 to N2 is OK if N3 can be reached from N1,
                                anypath(G,N3,N2,T).                     %       and then there is a path from N2 to N3, recursively

% allreaching(+Graph, +Node, -List) all the nodes that can be reached from Node. Suppose the graph is NOT circular!. Use findall and anyPath!
%test: allreaching([e(1,2),e(2,3),e(3,5)],1,[2,3,5]).%se esiste un percorso tra N e un nodo successivo allora tale nodo viene aggiunto alla lista finale
allreaching(Graph,Node,List):- findall(Successor,anypath(Graph,Node,Successor,_),List).
