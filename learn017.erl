-module(learn017).

-export([loop/0, loop2/0]).

loop() ->
	receive
		{link, PID} ->
			link(PID),
			loop();
		die -> 
			exit("DIE")
	end.

loop2() ->
	process_flag(trap_exit, true),
	receive
		{link, PID} ->
			link(PID),
			loop();
		die -> 
			exit("DIE 2");
		ExitMessage ->
			io:format("~p~n", [ExitMessage]),
			loop2()
	end.


%P1 = spawn_link(learn017, loop, []).
%P2 = spawn_link(learn017, loop2, []).
%P3 = spawn_link(learn017, loop, []).
%P1 ! {link, P2}.
%P1 ! die.

%New Step
%P1 = spawn(learn017, loop, []).
%P2 = spawn(learn017, loop2, []).
%P3 = spawn(learn017, loop, []).
%P1 ! {link, P2}.
%P2 ! {link, P3}.
%P1 ! die.

%ckeck process
%erlang:is_process_alive(P1).
%erlang:is_process_alive(P2).

%get process info
%erlang:process_info(P1).
%erlang:process_info(P2).