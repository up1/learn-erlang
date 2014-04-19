-module(learn008).

-export[double_list/1].

double_list([]) -> [];
double_list([H|T]) ->
	[H*2|double_list(T)].