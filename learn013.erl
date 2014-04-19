-module(learn013).

-export([list_process/1]).

list_process(List) ->
	receive
		{put, Value} ->
			NewList = [Value | List],
			list_process(NewList);
		{Caller, pop} ->
			[Value | NewList] = List,
			Caller ! Value,
			list_process(NewList);
		print ->
			io:format("~p~n", [List]),
			list_process(List)
	end.



%>P1 = spawn(learn013, list_process, [[]]).
%>register(p1, P1).
%>unregister(p1).


%>p1 ! print.
%>p1 ! {put, 5}.
%>p1 ! {self(), pop}.