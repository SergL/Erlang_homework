-module(p05).
-export([reverse/1]).

reverse([])->
    [];

reverse([H|[]])->
    [H];

reverse([H|T])->
    reverse(T,[H]).

reverse([],Itog)->
    Itog;

reverse([H|T],Itog)->
    reverse(T,[H|Itog]).

%P05 (*) Перевернуть список:   
%1> p05:reverse([1,2,3]). 
%[3,2,1]  
