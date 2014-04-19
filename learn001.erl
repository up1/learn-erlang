-module(learn001).

%hello/0 = function hello have zero parameter pattern
-export([ hello/0, hello/1, factorial/1 ]).

hello() ->
	io:format("Hello World Erlang.~n").

hello(joe) ->
	io:format("Hello joe.~n");

hello(mike) ->
	io:format("Hello mike.~n").

factorial(0) -> 1;
factorial(1) -> 1;
factorial(2) -> 1*2;
factorial(3) -> 1*2*3.