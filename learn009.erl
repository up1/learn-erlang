-module(learn009).

-export([map/2]).

map(_, []) -> [];
map(F, [H|T]) ->
	[F(H) | map(F, T) ].