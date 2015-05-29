-module(p15).
-export([replicate/2]).

replicate(L,I)->
	replicate(L,I,[]).

replicate([H|T],I,Itog)->
	replicate(T,I,[p0:repeat(I,H)|Itog]);

replicate([],_,Itog)->
	p05:reverse(p07:flatten(Itog)).

%P15 (**) Написать функцию­репликатор всех элементов входящего списка:  
%1> p15:replicate([a,b,c], 3). 
%[a,a,a,b,b,b,c,c,c] 
