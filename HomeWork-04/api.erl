-module(api).
-export([create/1, insert/2, delete/2, select/3, all/1, getItem/2, insert_test_data/1]).
-include_lib("stdlib/include/ms_transform.hrl").
-record(users,{id, name, age, dt}).


create(T)->
    Pid = ets:new(T, [named_table, {keypos, #users.id}] )
    , {ok, Pid}.

insert_test_data(T)->
    Data = [#users{id=1,   name="Serg",    age=15, dt={{2015,6,10},{11,52,50}}}
            , #users{id=3, name="Lev",     age=45, dt={{2015,6,11},{15,53,50}}}
            , #users{id=5, name="Pahsha",  age=87, dt={{2015,6,11},{18,52,50}}}
            , #users{id=4, name="Vasiliy", age=15, dt={{2015,6,12},{16,52,50}}}
            , #users{id=8, name="Петя",    age=17, dt={{2015,6,13},{14,52,50}}}
           ]
    , Itog = ets:insert(T, Data)
    , {ok, "Test Data Inserted = ",Itog}.

insert(T,{Id,Name,Age})->
    Dt =calendar:local_time()
    , Data = [#users{id=Id, name=Name, age=Age, dt=Dt}]
    , ets:insert(T, Data)
    , {ok, "Data Inserted = ",Data}.

select(T, DtStart, DtEnd)->
   Match =ets:fun2ms(fun(N = #users{dt = C})
		       when C >= DtStart andalso C =< DtEnd ->
		                N
		   end)
   , Itog = ets:select(T, Match)
   , {ok, "Itog = ",Itog}.

getItem(T,Id)->
    Itog=ets:lookup(T, Id)
    , {ok, "Itog =", Itog }.

delete(T,Id)->
    ets:delete(T, Id)
    , {ok, "Record #",Id, " deleted"}.

all(T)->
    Match =[{{'$1','$2','$3','$4','$5'},[],['$$']}]
    , Itog = ets:select(T, Match)
    , {ok, "All Record = ",Itog}.



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
%DtEnd={{2015,6,11},{13,53,00}}.
% {{2015,6,11},{13,53,0}}
% api:insert(my1,{8, "Vasil", 55}).
% api:insert(my1,{9, "Вася", 55}).
% api:select(my2,{{2015,06,12},{0,0,0}}, {{2015,06,13},{0,0,0}}).
% {ok,"Itog = ",
%    [{users,4,"Vasiliy",15,{{2015,6,12},{16,52,50}}}]}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

