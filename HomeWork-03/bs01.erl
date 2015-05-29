-module(bs01).
-export([first_word/1]).

first_word(B)->
	first_word2(B, <<>>).

first_word2(<< " ", Rest/binary>>, Acc)->
	Acc;

first_word2(<<H, Rest/binary>>, Acc) ->
	first_word2(Rest,<<Acc/binary, H>>);

first_word2(<<>>, Acc) ->
	Acc.

