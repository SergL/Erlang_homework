-module(p15).
-export([replicate/2]).

replicate([H|T],I)->
	replicate([H|T],I,[]).

replicate([],_,Itog)->
	p05:reverse(Itog);

replicate([H],I,Itog)->
	replicate([],I,p0:repeat(I,H,Itog));

replicate([H|T],I,Itog)->
	replicate(T,I,p0:repeat(I,H,Itog)).
