-module(p07).
-export([flatten/1]).
%-import(p05,[reverse/1]).



flatten([H|T])->
    flatten([H|T],[]).

flatten([[H|T]|L], Itog)->
    flatten([H,T|L],Itog);


flatten([[]|T], Itog)->
    flatten(T,Itog);


flatten([H|T], Itog)->
    flatten(T,[H|Itog]);

flatten([], Itog)->
    p05:reverse(Itog).


%P07 (**) Выровнять структуру с вложеными списками:  
% 93> p07:flatten([a,[b,[c,d,k],e,ddd], fff,[[gg]]]).
% [a,b,c,d,k,e,ddd,fff,gg]



