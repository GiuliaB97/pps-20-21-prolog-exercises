% search(Elem, List)
%test: Yes: search(3, [4,5 ,2, 3, 5]). 		No:search(32, [4,5 ,2, 3, 5]).

% search2Consecutive(Elem, List)
%test: Yes: search2Consecutive(3, [4,5 ,2, 3,3, 5]).		No search2Consecutive(3, [4,5 ,2, 3,9, 3, 5]).

% search2AnyElemBetween(Elem, List)
%test: Yes search2AnyElemBetween(3, [4,5 ,2, 3,0, 3, 5]).	No: search2AnyElemBetween(3, [4,5 ,2, 3, 3, 5]).

% search2Occurence(Elem, List)
%test: Yes: search2Occurence(3, [4,5 ,2, 3,9, 3, 5]). 		No: search2Occurence(3, [4,5 ,2, 3,9, 3, 5]).

% sizeNaturalNumber(List, Size)
%test: Yes sizeNaturalNumber([1,2], s(s(zero))).		No: sizeNaturalNumber([1,2], s(zero)).

% size(List, Size)
%test: Yes: size([1,2], 2).		No: size([1,2], 5).

% sum(List, Sum)
%test: Yes: sum([1,2], 3).		No:  sum([1,2], 6).

% max(List, Max)
%test: Yes: max([1,2, 0], 2).		No:  max([1,2, 0], 1)

% maxMin(List,Max,Min)
%test: Yes: maxMin([1,2, 9, 0], 9, 0). 		No: maxMin([1,2, 9, 0], 3, 0).

% same(List1,List2)
%test: Yes:same([1, 2], [1,2]).		No: same([1, 2], [0,1,2]).

% allBigger(L, L).
%test: Yes:allBigger([11, 22, 33], [0,1,2]).	 No:allBigger([11,0, 22, 33], [0,1,2]).

% sublist(List1,List2)
%test: Yes: sublist([1,2,3,4],[2,3]).		No: sublist([1,2,3,4],[2,3, 5]).

% seq(N,List)
%test: Yes: seq(2, [0,0]). 	No: seq(2, [0,0,0]).

% seqR(N,List)
% test: Yes: seqR(3,[3,2,1,0]).		No: seqR(3, [3,2,1]).

% seqL(N,List)
% test: Yes: seqL(3,[0,1,2,3])		No: seqL(3, [1, 2,3]).

% dropAny(Elem,List,OutList)
%test: Yes: dropAny(3,[0,1,2,3,7], [0,1,2,7]).		No: dropAny( 3,[0,1,2,3,7], [0,1,2,3,7]).

% dropFirst(Elem,List,OutList)
%test: Yes: dropFirst( 3,[0,1,2,3,7,3], [0,1,2,7,3]).		No: dropFirst( 3,[0,1,2,3,7,3], [0,1,2,3,7,3]).

% dropLast(Elem,List,OutList)
%test: Yes: dropLast( 3,[0,1,2,3,7,3], [0,1,2,3,7]).		No: dropLast( 3,[0,1,2,3,7,3], [0,1,2,3,7,3]).

% dropAll(Elem,List,OutList)
%test: Yes: dropAll( 3,[0,1,2,3,7,3], [0,1,2,7]).		No: dropLast( 3,[0,1,2,3,7,3], [0,1,2,3,7,3]).

%fromList(List, Graph)
%test Yes: fromList([10,20,30],[e(10,20),e(20,30)]).

%fromCircList(List, Graph)
%test: Yes: fromCircList([10,20,30],[e(10,20),e(20,30),e(30,10)]).

% dropNode(+Graph, +Node, -OutGraph); drop all edges starting and leaving from a Node
%test dropNode([e(1,2),e(1,3),e(2,3)],1,[e(2,3)]).

% reaching(+Graph, +Node, -List)% all the nodes that can be reached in 1 step from Node possibly use findall, looking for e(Node,_) combined with member(?Elem,?List)
% test:reaching([e(1,2),e(1,3),e(2,3)],1,L). -> L/[2,3].

% anypath(+Graph, +Node1, +Node2, -ListPath) a path from Node1 to Node2 if there are many path, they are showed 1-by-1
%test: anypath([e(1,2),e(1,3),e(2,3)],1,3,L). %output: – L/[e(1,2),e(2,3)] e L/[e(1,3)]

% allreaching(+Graph, +Node, -List)  all the nodes that can be reached from Node. Suppose the graph is NOT circular!. Use findall and anyPath!
% test: allreaching([e(1,2),e(2,3),e(3,5)],1,[2,3,5]).

%EXTRA

%reverse(List, OutList)
%test: Yes: reverse([1,2, 3, 4],[4, 3,2,1]). No: reverse([1,2, 3, 4],[4, 2,1]).


% double
%test: yes double([0, 1],[0,1,0,1]).	double([0, 1, 5],[0,1,5, 0,1, 5]).		no: double([0, 1],[0,1,8, 0,1]).	double([0, 1, 5],[0,1,0,1]).


% times
%test: times([0], 3, [0,0,0]). 	No: times([0], 2, [0,0,0]).

%listFirsts(List1, List2, OutList)
%test: listsFirst([[a,c,d],[b]],[a,b])
