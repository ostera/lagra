#!/bin/bash

manifest="$1"
suite="$2"
graphs="${3:-1}"

function get_config()
{
	roqet -D "$1" -r tsv -q \
        -e 'PREFIX tm: <http://www.w3.org/2001/sw/DataAccess/tests/test-manifest#>
            SELECT ?x ?file ?uscore ?typ
            WHERE { ?x a ?typ;
                       tm:action ?file;
                       tm:name ?name.
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
fun_names=

# State variables
last_testid=
last_file=

while read testid file uscore type; do
	case $type in
		TestNTriplesPositiveSyntax)
			funs="${funs}
$uscore(Config) ->
    io:format(\"Config = ~p~n\", [Config]),
    Store = ?config(store, Config),
    Filename = filename:join(?config(data_dir, Config), \"$file\"),
    io:format(\"Filename = ~p~n\", [Filename]),
    {ok, File} = file:open(Filename, [read]),
    ok = lagra:parse(Store, File, ntriples).
"
			fun_names="${fun_names}, $uscore/1"
			;;

		TestNTriplesNegativeSyntax)
			funs="${funs}
$uscore(Config) ->
    Store = ?config(store, Config),
    {ok, File} = file:open(
        filename:join(?config(data_dir, Config),
                              \"$file\"),
                      [read]),
    {error, _, _} = lagra:parse(Store, File, ntriples).
"
			fun_names="${fun_names}, $uscore/1"
			;;

		TestIsomorphismPositive)
			if [ "${last_testid}" = "${testid}" ]; then
				funs="${funs}
$uscore(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              \"$file\"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              \"$last_file\"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, \"urn:nil\"}, Store2, {iri, \"urn:nil\"}).
"
				fun_names="${fun_names}, $uscore/1"
			else
				last_testid="${testid}"
				last_file="${file}"
			fi
			;;

		TestIsomorphismNegative)
			if [ "${last_testid}" = "${testid}" ]; then
				funs="${funs}
$uscore(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              \"${file}\"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              \"${last_file}\"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, \"urn:nil\"}, Store2, {iri, \"urn:nil\"}).
"
				fun_names="${fun_names}, $uscore/1"
			else
				last_testid="${testid}"
				last_file="${file}"
			fi
			;;

		*)
			echo Unknown test type: $type >&2
			exit 1
			;;
	esac
done < <(get_config "${manifest}")

fun_names="${fun_names/, /}"

cat <<EOF
%%% The following module is generated by the get-test-params.sh script.
%%% Do not edit by hand.

-module($suite).
-include_lib("common_test/include/ct.hrl").
-export([all/0]).

%% The test suite is generated from the test manifest file $1

-export([${fun_names}]).
-export([init_per_suite/1, end_per_suite/1]).
-export([init_per_testcase/2, end_per_testcase/2]).

init_per_suite(Config) ->
    {ok, _} = application:ensure_all_started(lagra),
    Config.

end_per_suite(_Config) ->
    application:stop(lagra),
    ok.

EOF

case "${graphs}" in
	1)
		cat <<EOF
init_per_testcase(_, Config) ->
    Store = lagra:create_store(trivial),
    [{store, Store}|Config].

end_per_testcase(_, Config) ->
    Store = ?config(store, Config),
    lagra:destroy_store(Store).

EOF
		;;
	2)
		cat <<EOF
init_per_testcase(_, Config) ->
    Store1 = lagra:create_store(trivial),
    Store2 = lagra:create_store(trivial),
    [{store1, Store1}, {store2, Store2}|Config].

end_per_testcase(_, Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    lagra:destroy_store(Store1),
	lagra:destroy_store(Store2).

EOF
esac

cat <<EOF
${funs}

all() ->
    [${fun_names//\/1/}].

EOF
