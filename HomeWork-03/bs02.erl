-module(bs02).
-export([words/1]).

words(Bin)->
	bs03:split(Bin, " ").

%BS02: Разделить строку на слова:  
%1> BinText02 = <<"Text with four words">>. 
%<<”Text with four words”>> 
%2> bs02:words(BinText02). 
%[<<”Text”>>, <<”with”>>, <<”four”>>, <<”words”>>]




