-module(p0).
-export([repeat/3]).


repeat(_I=0,_S,Arr)->
    p05:reverse(Arr);

repeat(I,S,Arr)->
	repeat(I-1,S,[S|Arr]).





% p12:repeat(I,S,Arr). 
%[a,a,a,a,b,c,c,a,a,d,e,e,e,e]     


