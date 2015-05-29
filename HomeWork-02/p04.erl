-module(p04).
-export([len/1]).

len(L)->
    len(L,0).

len([_H|T],Count)->
    len(T,Count+1);

len([],Count)->
    Count.

% P04 (*) Посчитать количество элементов списка:  
%1> p04:len([]).
%0 
%2> p04:len([a,b,c,d]).
%4  

