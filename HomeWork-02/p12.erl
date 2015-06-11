-module(p12).
-export([decode_modif/1]).

decode_modif([H|T])->
    decode_modif(T,H,[]).

decode_modif([],{I,S},Itog)->
	p05:reverse(p0:repeat(I,S,Itog));

decode_modif([],S,Itog)->
	p05:reverse(p0:repeat(1,S,Itog));

decode_modif([H],{I,S},Itog)->
	decode_modif([],H,p0:repeat(I,S,Itog));

decode_modif([H],S,Itog)->
	decode_modif([],H,p0:repeat(1,S,Itog));

decode_modif([H|T],{I,S},Itog)->
	decode_modif(T,H,p0:repeat(I,S,Itog));

decode_modif([H|T],S,Itog)->
	decode_modif(T,H,p0:repeat(1,S,Itog)).



% 65> p13:decode_modif([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e},{1,f}]). 
%[a,a,a,a,b,c,c,a,a,d,e,e,e,e,f]
    


