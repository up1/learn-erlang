-module(learn011).

-export([foldl/3]).

foldl(F, Acc, [X]) -> F(X, Acc);
foldl(F, Acc, [H|T]) ->
	foldl(F, F(H, Acc), T).
