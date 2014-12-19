-module(magic_castle_lib).
-include_lib("../deps/triq/include/triq.hrl").

-export([add/2]).

add(X,Y) when X >= -235 ->
  io:format("norm: ~p,~p~n", [X, Y]),
  X + Y;
add(X,Y) -> 
  io:format("bug: ~p,~p~n", [X, Y]),
  234.

prop_add_works() ->
    ?FORALL(L,int(-5000,5000), 
      ?FORALL(M,int(-5000,5000),
              ?WHENFAIL(io:format("L=~p, M=~p~n", [L,M]),
                        magic_castle_lib:add(L,M) == magic_castle_lib:add(M,L)))).

