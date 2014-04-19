-module(learn004).

-export[sum/1, count/1, average/1].

sum([]) -> 0;
sum([H|T]) ->
	H+sum(T).

count([]) -> 0;
count([_|T])->
	1+count(T).

average(L) ->
	sum(L)/count(L).



