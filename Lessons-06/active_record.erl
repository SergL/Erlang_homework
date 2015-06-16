-module(active_record).
-export([some_fun/2]).

some_fun(FirstArg, SecondArg)->
    io:format("FirstArg:~p, secodArg:~p~n", [FirstArg,SecondArg]).


