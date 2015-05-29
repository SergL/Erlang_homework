-module(p11).
-export([encode_modified/1]).

encode_modified([H|T])->
    encode_modified(T,H,[],1).

encode_modified([H|[]],H,Itog,Counter)->
	encode_modified([],H,[{Counter+1,H}|Itog],Counter);

encode_modified([H|[]],A,Itog,Counter)->
	L=[{Counter,A}|Itog],
	encode_modified([],H,[H|L],Counter);

encode_modified([H|T],H,Itog,Counter)->
	encode_modified(T,H,Itog,Counter+1);

encode_modified([H|T],A,Itog,1)->
	encode_modified(T,H,[A|Itog],1);
	
encode_modified([H|T],A,Itog,Counter)->
	encode_modified(T,H,[{Counter,A}|Itog],1);


encode_modified([],_,Itog,_)->
	p05:reverse(Itog).


% p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]). 
% [{4,a},b,{2,c},{2,a},d,{4,e}]    


