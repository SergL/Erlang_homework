-module(p14).
-export([duplicate/1]).

duplicate([H|T])->
	p15:replicate([H|T],2).


