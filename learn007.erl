-module(learn007).

-export[command/1].

sum_tail([], Acc) -> Acc;
sum_tail([H|T], Acc) ->
	sum_tail(T, H+Acc).

count_tail([], Acc) -> Acc;
count_tail([_|T], Acc) ->
	count_tail(T, Acc+1).

average(L) ->
	if
		L =/= [] ->
			sum_tail(L, 0)/count_tail(L, 0);
		true ->
			error
	end.

command(Message) ->
	case Message of
		{average, L} -> average(L);
		{sum, L} -> sum_tail(L, 0)
	end.
	



