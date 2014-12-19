-module(magic_castle_fsm).
-behaviour(gen_fsm).

-export([init/1, handle_event/3, handle_sync_event/4, handle_info/3, terminate/3, code_change/4]).
-export([s_initial/3, s_initial/2]).

-record(state, 
    {
    id = 0,
    instances = []
    }).

init([Id]) ->
  State = #state{id = Id},
  lager:info("hello from ~p~n", [Id]),
  gen_fsm:start_timer(5000, {boop, boop, boop}),
  {ok, s_initial, State}.

handle_event(Event, StateName, StateData) ->
  lager:info("~p: uncaught event ~p in ~p~n", [StateData#state.id, Event, StateName]),
  {next_state, StateName, StateData}.

handle_sync_event(Event, From, StateName, StateData) ->
  lager:info("~p: uncaught sync event ~p from ~p in ~p~n", [StateData#state.id, Event, From, StateName]),
  {next_state, StateName, StateData}.

handle_info(Info, StateName, StateData) ->
  lager:info("~p: uncaught info ~p in ~p~n", [StateData#state.id, Info, StateName]),
  {next_state, StateName, StateData}.

terminate(_Reason, _StateName, _StateData) ->
  ok.

code_change(_OldVsn, StateName, StateData, _Extra) -> 
  {ok, StateName, StateData}.

s_initial(Event, StateData) ->
  lager:info("~p: unexpected event ~p in s_initial~n", [StateData#state.id, Event]),
  {next_state, s_initial, StateData}.
s_initial(_Event, _From, StateData) ->
  {next_state, s_initial, StateData}.

