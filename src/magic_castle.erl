-module(magic_castle).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
  magic_castle_sup:start_link().

stop(_State) ->
	ok.
