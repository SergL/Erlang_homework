-module(p14).
-export([duplicate/1]).

duplicate([H|T])->
	p15:replicate([H|T],2).


%P14 (*) Написать дубликатор всех элементов входящего списка:  
% 1> p14:duplicate([a,b,c,c,d]). 
% [a,a,b,b,c,c,c,c,d,d]


