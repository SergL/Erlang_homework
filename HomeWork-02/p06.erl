-module(p06).
-export([is_palindrome/1]).


is_palindrome(LIST=[_H|_T])->
	LIST=:=p05:reverse(LIST),
	true.


