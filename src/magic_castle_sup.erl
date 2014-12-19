-module(magic_castle_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

-define(FSMCHILD(N,M), {N, {gen_fsm, start_link, [{local, N}, M,[N],[]]}, permanent, 5000, worker, [M]}).

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
	Procs = [
          %%?FSMCHILD(bob, magic_castle_fsm),
          %%?FSMCHILD(sue, magic_castle_fsm),
          %%?FSMCHILD(mary, magic_castle_fsm)
        ],
	{ok, {{one_for_one, 1, 5}, Procs}}.
