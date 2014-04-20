-module(learn018).

-export([start/0, parent/0, child/1]).

start() ->
	spawn(?MODULE, parent, []).

parent() ->
	process_flag(trap_exit, true),
	%Create process link => P1, P2, P3
	P1 = spawn_link(?MODULE, child, [none]),
	P2 = spawn_link(?MODULE, child, [P1]),
	P3 = spawn_link(?MODULE, child, [P2]),

	receive
		{'EXIT', KILLID, _} ->
			io:format("~p~n", [KILLID]),
			parent()
			%start()
	end.

child(none) ->
	receive
	
	after 5000 ->
		exit("DIE")
	end;

child(Link) ->
	link(Link),
	receive
	
	after 5000 ->
		exit("DIE")
	end.


%c(learn018).
%learn018:start().
