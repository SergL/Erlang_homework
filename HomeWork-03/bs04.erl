-module(bs04).
-export([decode_xml/1]).

decode_xml(BinXML)->
	Itog={},
	Status="",
	TagName="",
	TagContent="",
	Tags=[],

	parser(BinXml,[],Itog,Status,TagName,TagContent, Tags).

%byte_size(list_to_binary(S)).
%    Sep = list_to_binary(S),
%   L = byte_size(Sep),
%    split( Bin, [], <<>>,  Sep,  L).

parser(BinXml,Itog,Status, TagName,TagContent, Tags).
case {BinXml, Status} of
     {<<"</", Rest/binary>>, _}->
        tag_end(Rest, Itog, TagName,TagContent, Tags);
     {<<"<", Rest/binary>>, _>
	tag_start(Rest, Itog, TagName, TagContent, Tags);
     <<H:1/binary, Rest/binary>>, "start" ->
	tag_start(Rest, Itog, TagName, TagContent, Tags);
     <<H:1/binary, Rest/binary>>, "content" ->
	tag_content(Rest, Itog, TagName, TagContent, Tags);
     <<H:1/binary, Rest/binary>>, "end" ->
	tag_end(Rest, Itog, TagName, TagContent, Tags);
    <<>> -> 
	Itog
end.


tag_start(<<">", Rest/binary>>, Itog, TagName, TagContent, Tags)->
	Itog1={{<<TagName>>, [], [parser(Rest]}
tag_start(<<H:1/binary, Rest/binary>>, Itog, TagName, TagContent, Tags);



%BS04: Разобрать XML­документ без атрибутов:  
%1> BinXML = <<"<start><item>Text1</item><item>Text2</item></start>">>. 
%<<"<start><item>Text1</item><item>Text2</item></start>">> 
%2> bs04:decode_xml(BinXML). 
%{<<"start">>, [], [ 
%    {<<"item">>, [], [<<"Text1">>]}, 
%    {<<"item">>, [], [<<"Text2">>]} 
%]}  




