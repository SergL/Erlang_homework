-module(p10).
-export([encode/1]).

encode([H|T])->
    encode(T,H,[],1).


encode([H|[]],H,Itog,Counter)->
	L=Counter+1,
	encode([],H,[{L,H}|Itog],Counter);

encode([H|[]],A,Itog,Counter)->
	L=[{Counter,A}|Itog],
	encode([],H,[{1,H}|L],Counter);

encode([H|T],H,Itog,Counter)->
	encode(T,H,Itog,Counter+1);
	
encode([H|T],A,Itog,Counter)->
	encode(T,H,[{Counter,A}|Itog],1);

encode([],_,Itog,_)->
	p05:reverse(Itog).


% p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]). 
%[{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]  


