-module(p08).
-export([compress/1]).

compress([H|T])->
	compress([H|T],[]).

compress([H,H|T], ITOG)->
	compress([H|T],ITOG);

compress([H|T], ITOG)->
	compress(T,[H|ITOG]);

compress([], ITOG)->
	p05:reverse(ITOG).


%%P08 (**) Удалить последовательно следующие дубликаты:  
%% 21> p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e,f,g,g]).
%% [a,b,c,a,d,e,f,g]

