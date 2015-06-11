-module(p03).
-export([element_at/2]).

element_at([H|_T],1)->
   H;

element_at([],_NUM)->
    undefined;

element_at([_H|T],NUM)->
	element_at(T,NUM-1).


