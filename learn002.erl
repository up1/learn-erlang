-module(learn002).

%hello/0 = function hello have zero parameter pattern
-export([ factorial/1 ]).


factorial(0) -> 1;
factorial(1) -> 1;
factorial(N) when(N>1) -> 
	N*factorial(N-1).

