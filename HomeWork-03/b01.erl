-module(bs01).
-export([first_word/1]).

first_word(Bin)->
	first_word(Bin,<<>>).

first_word(<<" ", _Body/binary>>, Acc)->
	Acc;

first_word(<<H, Body/binary>>, Acc)->
	first_word(Body,<<Acc, H>>);

first_word(<<>>,Acc)->
	Acc.

