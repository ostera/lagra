-module(lagra_store_trivial).
-behaviour(gen_server).

%% API.
-export([start_link/0]).

%% gen_server.
-export([init/1]).
-export([handle_call/3]).
-export([handle_cast/2]).
-export([handle_info/2]).
-export([terminate/2]).
-export([code_change/3]).

-record(state, {quads :: [lagra_model:quad()]
	   }).

%% API.

-spec start_link() -> {ok, pid()}.
start_link() ->
	gen_server:start_link(?MODULE, [], []).

%% gen_server.

init([]) ->
	{ok, #state{quads=[]}}.

handle_call({po_from_s, Subject}, _From, State) ->
	{reply, po_from_s(State, Subject), State};
handle_call(_Request, _From, State) ->
	{reply, ignored, State}.

handle_cast(_Msg, State) ->
	{noreply, State}.

handle_info(_Info, State) ->
	{noreply, State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

%% Internals

-spec po_from_s(#state{}, lagra_model:subject()) ->
					   [{lagra_model:predicate(), lagra_model:object()}].
po_from_s(#state{quads=Quads}, Subject) ->
	[{lagra_model:predicate(T), lagra_model:object(T)}
	 || T <- Quads, lagra_model:subject(T) =:= Subject].