#!/bin/bash

manifest="$1"
suite="$2"

function get_config()
{
	roqet -D "$1" -r tsv -q \
        -e 'PREFIX tm: <http://www.w3.org/2001/sw/DataAccess/tests/test-manifest#>
            SELECT ?x ?file ?uscore ?typ ?result
            WHERE { ?x a ?typ;
                       tm:action ?file;
                       tm:name ?name.
                    OPTIONAL { ?x tm:result ?result. }
                    BIND (REPLACE(?name, "-", "_") AS ?uscore)
                   }' \
        | sed -e 1d \
		      -e 's=<file://[^>]*/ct/[^/]*/==g' \
		      -e 's=<http://www.w3.org/ns/rdftest#==' \
			  -e 's=<http://data.carfax.org.uk/def/rdftest#==' \
		      -e 's=>==g' \
		      -e 's="==g'
}

# Output variables
funs=
declare -a fun_names
fun_names=()

# State variables
last_testid=
last_file=

while read testid file uscore type result; do
	uscore=${uscore,}
	case $type in
		TestNTriplesPositiveSyntax)
			funs="${funs}
$uscore(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    Filename = filename:join(?config(data_dir, Config), \"$file\"),
    io:format(\"Filename = ~p~n\", [Filename]),
    Testfile = filename:join(?config(priv_dir, Config), \"$file\"),
    io:format(\"Testfile = ~p~n\", [Testfile]),

    % Load the file
    {ok, File1} = file:open(Filename, [read, {encoding, utf8}, binary]),
    ok = lagra:parse(Store1, File1, ntriples),
    file:close(File1),

    % Write it out
	{ok, File2} = file:open(Testfile, [write, {encoding, utf8}]),
	ok = lagra:serialize(Store1, File2, ntriples, #{notify => sync}),
    file:close(File2),

	io:format(\"~ts~n---~n~ts~n\", [os:cmd(\"cat \"++Filename),
                                    os:cmd(\"cat \"++Testfile)]),

    % Load it again
    {ok, File3} = file:open(Testfile, [read, {encoding, utf8}, binary]),
    ok = lagra:parse(Store2, File3, ntriples),
    file:close(File3),

    % Test that they're isomorphic
    true = lagra:isomorphic(Store1, <<\"urn:nil\">>, Store2, <<\"urn:nil\">>).
"
			fun_names+=($uscore)
			;;

		TestNTriplesNegativeSyntax)
			# These cases aren't valid NTriples in the first place, so
			# don't produce a sensible graph to serialize.
			;;

		*)
			echo Unknown test type: $type >&2
			exit 1
			;;
	esac
done < <(get_config "${manifest}")

cat <<EOF
%%% The following module is generated by the gen-serializer-test-suite.sh script.
%%% Do not edit by hand.

-module($suite).
-include_lib("common_test/include/ct.hrl").
-export([all/0]).

%% The test suite is generated from the test manifest file $1

EOF

for fn in ${fun_names[@]}; do
	echo "-export([${fn}/1])."
done

cat <<EOF
-export([init_per_suite/1, end_per_suite/1]).
-export([init_per_testcase/2, end_per_testcase/2]).

init_per_suite(Config) ->
    {ok, _} = application:ensure_all_started(lagra),
    Config.

end_per_suite(_Config) ->
    application:stop(lagra),
    ok.

init_per_testcase(_, Config) ->
    Store1 = lagra:create_store(trivial),
    Store2 = lagra:create_store(trivial),
    [{store1, Store1}, {store2, Store2}|Config].

end_per_testcase(_, Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    lagra:destroy_store(Store1),
	lagra:destroy_store(Store2).

${funs}

all() ->
EOF

IFS=,
echo "    [${fun_names[*]}]."
