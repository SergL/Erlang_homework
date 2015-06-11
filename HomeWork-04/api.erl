-module(api).
-export([create/1, insert/2, delete/2, select/3, all/1, getItem/2]).

create(T)->
    ets:new(T, [named_table]).

insert(T,{Id,Name,Age})->
    ets:insert(T, {Id,Name,Age,calendar:local_time()}).

select(T,_Dt1,_Dt2)->
    fun2mc
    ets:select(T, []).

getItem(T,Id)->
    ets:lookup(T, Id).

delete(T,Id)->
    ets:delete(T, Id).

all(T)->
    ets:tab2list(T).


%fib_test_() ->[
%    ?_assert(fib(0)=:=1),
%    ?_assert(fib(1)=:=1),
%    ?_assert(fib(2)=:=2),
%    ?_assert(fib(3)=:=3),
%    ?_assert(fib(4)=:=5),
%    ?_assert(fib(5)=:=8),
%    ?_assertException(error, function_clause, fib(-1)),
%    ?_assert(fib(31)=:=2178309)].
%endif