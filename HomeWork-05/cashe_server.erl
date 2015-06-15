-module(cache_server).
-behaviour(gen_server).

-record(my_data,{key, value, dt=calendar:local_time()}).

-export([start/1, insert/2, lookup/1, lookup_by_date/2]).
-export([start_link/1, handle_call/3, handle_cast/2,
         handle_info/2, terminate/2, code_change/3]).


start(Options) ->
  gen_server:start_link({global, ?MODULE}, ?MODULE, [], Options).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
﻿% Домашнее задание (лекция 4)
% Процессы, ets, records, модуль calendar, модуль timer
% Написать кеширующий сервер:
% {ok, Pid} = cache_server:start_link([{ttl, 3600}]).
% ok = cache_server:insert(Key, Value).
% {ok, Value} = cache_server:lookup(Key).
% DateFrom = {{2015,1,1},{00,00,00}}.
% DateTo = {{2015,1,10},{23,59,59}}.
% {ok, Value} = cache_server:lookup_by_date(DateFrom, DateTo).
%
% Сервер должен хранить данные то количество 
% времени которе было указано при старте. Время задается в секундах.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
