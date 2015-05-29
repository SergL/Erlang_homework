-module(p13).
-export([decode/1]).

decode([H|T])->
    decode(T,H,[]).

decode([],{I,S},Itog)->
	p05:reverse(p07:flatten([p0:repeat(I,S)|Itog]));

decode([H|T],{I,S},Itog)->
	decode(T,H,[p0:repeat(I,S)|Itog]).

% 65> p13:decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e},{1,f}]). 
%[a,a,a,a,b,c,c,a,a,d,e,e,e,e,f]
    


