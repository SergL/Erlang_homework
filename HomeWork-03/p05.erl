-module(p05).
-export([reverse/1]).

reverse(LIST)->
    reverse(LIST,[]).

reverse([],ITOG)->
    ITOG;

reverse([H|T],ITOG)->
    reverse(T,[H|ITOG]).
