-module(learn010).

-export([foldr/2]).

foldr(F, [X,Y]) -> F(X,Y);
foldr(F, [H|T]) ->
	F(H, foldr(F, T)).
