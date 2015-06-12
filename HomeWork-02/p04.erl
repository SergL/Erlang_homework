-module(p04).
-export([len/1]).

len(LIST)->
    len(LIST,0).

len([_H|T],COUNT)->
	len(T,COUNT+1);

len([],COUNT)->
	COUNT.

