-module(learn019).
-compile(export_all).

start_game() ->
	io:format("Love Love~n"),
	receive
		a_point ->
			score_15_0();
		b_point ->
			score_0_15()
	end.

score_15_0() ->
	io:format("Fifteen Love~n"),
	receive
		a_point ->
			a_win();
		b_point ->
			score_15_15()
	end.

score_0_15() ->
	io:format("Love Fifteen~n"),
	receive
		a_point ->
			score_15_15();
		b_point ->
			b_win()
	end.

score_15_15() ->
	io:format("Fifteen All~n"),
	receive
		a_point ->
			a_win();
		b_point ->
			b_win()
	end.

a_win() ->
	io:format("A win~n").

b_win() ->
	io:format("B win~n").