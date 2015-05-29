-module(p09).
-export([pack/1]).

pack([H|T])->
    pack(T,H,[],[H]).


pack([],_,Itog,_)->
	p05:reverse(Itog);

pack([H|[]],H,Itog,SubItog)->
	L=[H|SubItog],
	pack([],H,[L|Itog],SubItog);

pack([H|[]],_A,Itog,SubItog)->
	L1=[SubItog|Itog],
	L2=[[H]|L1],
	pack([],H,L2,SubItog);


pack([H|T],H,Itog,SubItog)->
	pack(T,H,Itog,[H|SubItog]);
	
pack([H|T],_A,Itog,SubItog)->
	pack(T,H,[SubItog|Itog],[H]).


% P09 (**) Запаковать последовательно следующие дубликаты во вложеные списки:  
% p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e,f]).        
% [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e],[f]]


