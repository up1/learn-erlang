-module(learn012).

-export([process_loop/0]).

process_loop() ->
	receive
		Message ->
			io:format("Process id= ~p,Receive message ~s~n", [self(), Message]),
			process_loop()
	end.



%>P1 = spawn(learn012, process_loop, []).
%>P2 = spawn(learn012, process_loop, []).
%>register(p1, P1).
%>register(p2, P2).
%>unregister(p1).
%>unregister(p2).