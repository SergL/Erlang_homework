-module(api).
-export([create/1, insert/2, delete/2, select/3, all/1, getItem/2]).
-include_lib("stdlib/include/ms_transform.hrl").
%-record(users,{name, age, dt={}}).

create(T)->
    Pid = ets:new(T, [named_table]),
    {ok, Pid}.

insert(T,{Id,Name,Age})->
    ets:insert(T, Data={Id,Name,Age,calendar:local_time()}),
    {ok, "Data Inserted = ",Data}.

select(T,DtStart,DtEnd)->
%   Match =ets:fun2ms(fun(Dt) when Dt >= DtBegin, Dt =< DtEnd -> Dt end),
    Match =[{{'$1','$2','$3','$4'},[{'>','$4', DtStart}],['$$']}],
    Itog = ets:select(T, Match),
    {ok, "Itog = ",Itog}.

getItem(T,Id)->
    Itog=ets:lookup(T, Id),
    {ok, "Itog =", Itog }.

delete(T,Id)->
    ets:delete(T, Id),
    {ok, "Record #",Id, " deleted"}.

all(T)->
    Match =[{{'$1','$2','$3','$4'},[],['$$']}]
    Itog = ets:select(T),
    {ok, "All Record = ",Itog}.



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

