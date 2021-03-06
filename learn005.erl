%Tail recusive

-module(learn005).

-export[average/1].

sum_tail([], Acc) -> Acc;
sum_tail([H|T], Acc) ->
	sum_tail(T, H+Acc).

count_tail([], Acc) -> Acc;
count_tail([_|T], Acc) ->
	count_tail(T, Acc+1).

average(L) ->
	sum_tail(L, 0)/count_tail(L, 0).



