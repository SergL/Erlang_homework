-module(p08).
-export([compress/1]).

compress([H|T])->
	compress([H|T],[]).

compress([H,H|T], ITOG)->
	compress([H|T],ITOG);

compress([H|T], ITOG)->
	compress(T,[H|ITOG]);

compress([], ITOG)->
	P05:reverse(ITOG).



%%P08 (**) Удалить последовательно следующие дубликаты:  
%% c(p08). p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
