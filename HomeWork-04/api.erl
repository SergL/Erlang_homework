-module(api).
-export([create/1, insert/2, delete/2, select/3, all/1, getItem/2]).
%-include_lib("stdlib/include/ms_transform.hrl").

create(T)->
    ets:new(T, [named_table]).

insert(T,{Id,Name,Age})->
    ets:insert(T, {Id,Name,Age,calendar:local_time()}).

select(T,DtBegin,DtEnd)->
%   Match =ets:fun2ms(fun(Dt) when Dt >= DtBegin, Dt =< DtEnd -> Dt end),
    Match =ets:match(T, {'$1',[],'$1'}),
    ets:select(T, Match).

getItem(T,Id)->
    ets:lookup(T, Id).

delete(T,Id)->
    ets:delete(T, Id).

all(T)->
    ets:tab2list(T).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%c(api).
%{ok,api}
% api:create(my1).
%my1
%10> api:create(my1).
%my1
%11> api:insert(my1,{1, "serg", 40}).
%true
%12> api:insert(my1,{2, "Dima", 30}).
%true
%13> api:insert(my1,{5, "Oleg", 23}).
%true
%14> api:all(my1).  
%[{2,"Dima",30,{{2015,6,11},{13,52,50}}},
% {1,"serg",40,{{2015,6,11},{13,52,36}}},
% {5,"Oleg",23,{{2015,6,11},{13,53,6}}}]
%
%15> DtStart={{2015,6,11},{13,52,50}}.
%{{2015,6,11},{13,52,50}}
%16> DtEnd={{2015,6,11},{13,53,00}}.  
%{{2015,6,11},{13,53,0}}
%17> api:insert(my1,{8, "Vasil", 55}).       
%%18> api:insert(my1,{9, "Вася", 55}). 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

