-module(p06).
-export([is_palindrome/1]).

is_palindrome(LIST=[_H|_T])->
    LIST=p05:reverse(LIST),
    true.

% Определить, является ли список палиндромом:  
% p06:is_palindrome([1,2,3,2,1]). 
% true  
% 16> p06:is_palindrome([1,2,3,2,1,5]). 
%** exception error: no match of right hand side value [5,1,2,3,2,1]
%     in function  p06:is_palindrome/1 (p06.erl, line 5)




