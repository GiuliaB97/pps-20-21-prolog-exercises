% search(Elem, List)

% search2Consecutive(Elem, List)

% search2AnyElemBetween(Elem, List)

% search2Occurence(Elem, List)

% size(List, Size)

%sizeZero(List, Size)	%test: sizeZero([1,2], s(s(zero))).

%sum(List, Sum)

% max(List, Max)

% maxMin(List,Max,Min)

% same(List1,List2)

%allBigger(L, L).

% sublist(List1,List2)

% seq(N,List)

% seqR(N,List)

% seqR(N,List)

% dropAny(Elem,List,OutList)

% dropFirst(Elem,List,OutList)

% dropLast(Elem,List,OutList)

% dropAll(Elem,List,OutList)

% fromList(List, Graph)

% fromCircList(List, Graph)

% dropNode(Graph, Node, OutGraph); drop all edges starting and leaving from a Node reaching(+Graph, +Node, -List); all the nodes that can be reached in 1 step from Node possibly use findall, looking for e(Node,_) combined with member(?Elem,?List)

% reaching(+Graph, +Node, -List)% all the nodes that can be reached in 1 step from Node possibly use findall, looking for e(Node,_) combined with member(?Elem,?List)
% test:reaching([e(1,2),e(1,3),e(2,3)],1,L). -> L/[2,3].

% anypath(+Graph, +Node1, +Node2, -ListPath) a path from Node1 to Node2 if there are many path, they are showed 1-by-1
%test: anypath([e(1,2),e(1,3),e(2,3)],1,3,L). %output: – L/[e(1,2),e(2,3)] e L/[e(1,3)]

% allreaching(+Graph, +Node, -List)  all the nodes that can be reached from Node. Suppose the graph is NOT circular!. Use findall and anyPath!
% test: allreaching([e(1,2),e(2,3),e(3,5)],1,[2,3,5]).

% grid-like nets
%During last lesson we see how to generate a gridlike network. Adapt that code to create a graph for the predicates implemented so far. Try to generate all paths from a node to another,limiting the maximum number of hops

%EXTRA

%inv
%test: inv([0,1],[1,0])


% double
%test: yes double([0, 1],[0,1,0,1]).	double([0, 1, 5],[0,1,5, 0,1, 5]).		no: double([0, 1],[0,1,8, 0,1]).	double([0, 1, 5],[0,1,0,1]).


% times
%test: times([0], 3, [0,0,0])
% proj
%test: proj([[a,c,d],[b]],[a,b])
