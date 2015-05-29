-module(p0).
-export([repeat/2]).

repeat(I, S)->
    repeat(I,S,[]).

repeat(_I=0,_S,Arr)->
    Arr;

repeat(I,S,Arr)->
    repeat(I-1,S,[S|Arr]).


% p0:repeat(5,a). 
%[a,a,a,a,a]     


