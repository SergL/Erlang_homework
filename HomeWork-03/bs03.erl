-module(bs03).
-export([split/2]).

split(Bin,S)->
%byte_size(list_to_binary(S)).
    Sep = list_to_binary(S),
    L = byte_size(Sep),
    split( Bin, [], <<>>,  Sep,  L).

split(Bin, List, Word, Sep, L)->
case Bin of
     <<Sep:L/binary, Rest/binary>> ->
        split(Rest, [Word|List], <<>>, Sep, L);

     <<H:1/binary, Rest/binary>> ->
        split(Rest, List, <<Word/binary, H/binary>>, Sep, L);

    <<>> -> 
	p05:reverse([Word|List])
end.

%BS03: Разделить строку на части, с явным указанием разделителя:  
%Пример: 
%1> BinText = <<"Col1­:­Col2­:­Col3­:­Col4­:­Col5">>. 
%<<”Col1­:­Col2­:­Col3­:­Col4­:­Col5”>> 
%2> bs03:split(BinText, "-­:-"). 
%[<<"Col1">>,<<"Col2">>,<<"Col3">>,<<"Col4">>,<<"Col5">>]




