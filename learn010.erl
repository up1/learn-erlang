-module(learn010).

-export([foldr/3]).

foldr(F, Acc, [X]) -> F(X,Acc);
foldr(F, Acc, [H|T]) ->
	F(H, foldr(F, Acc, T)).
