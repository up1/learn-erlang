-module(learn016).

-export([loop/0]).

loop() ->
	receive
		{link, PID} ->
			link(PID),
			loop();
		die -> 
			exit("DIE")
	end.


%P1 = spawn_link(learn016, loop, []).
%P2 = spawn_link(learn016, loop, []).
%P1 ! {link, P2}.
%P1 ! die.

%ckeck process
%erlang:is_process_alive(P1).
%erlang:is_process_alive(P2).

%get process info
%erlang:process_info(P1).
%erlang:process_info(P2).