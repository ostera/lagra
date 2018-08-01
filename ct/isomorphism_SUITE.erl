%%% The following module is generated by the get-test-params.sh script.
%%% Do not edit by hand.

-module(isomorphism_SUITE).
-include_lib("common_test/include/ct.hrl").
-export([all/0]).

%% The test suite is generated from the test manifest file ct/isomorphism_SUITE_data/manifest.ttl

-export([jena_iso_00/1, jena_iso_01/1, jena_iso_02/1, jena_iso_03/1, jena_iso_04/1, jena_iso_05/1, jena_iso_06/1, jena_iso_07/1, jena_iso_20/1, jena_iso_21/1, jena_iso_22/1, jena_iso_23/1, jena_iso_24/1, jena_iso_62/1, jena_iso_63/1, jena_iso_65/1, jena_iso_66/1, easyrdf_bad_01/1, easyrdf_bad_02/1, easyrdf_bad_03/1, easyrdf_bad_04/1, easyrdf_bad_05/1, easyrdf_bad_06/1, easyrdf_good_01/1, easyrdf_good_02/1, easyrdf_good_03/1, easyrdf_good_04/1, easyrdf_good_05/1, easyrdf_good_06/1, easyrdf_good_07/1, node_rdf_01/1, node_rdf_02/1, ruby_rdf_match_test1/1, ruby_rdf_match_test2/1, ruby_rdf_match_test3/1, ruby_rdf_match_test4/1, ruby_rdf_match_test5/1, ruby_rdf_match_test6/1, ruby_rdf_match_test7/1, ruby_rdf_nomatch_test1/1, ruby_rdf_nomatch_test2/1, ruby_rdf_nomatch_test3/1, ruby_rdf_nomatch_test4/1, ruby_rdf_nomatch_test5/1, ruby_rdf_nomatch_test6/1]).
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


jena_iso_00(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_00-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_00-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_01(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_01-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_01-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_02(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_02-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_02-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_03(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_03-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_03-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_04(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_04-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_04-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_05(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_05-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_05-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_06(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_06-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_06-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_07(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_07-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_07-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_20(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_20-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_20-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_21(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_21-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_21-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_22(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_22-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_22-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_23(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_23-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_23-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_24(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_24-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_24-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_62(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_62-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_62-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_63(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_63-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_63-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_65(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_65-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_65-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

jena_iso_66(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_66-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "jena-iso_66-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

easyrdf_bad_01(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-bad-01-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-bad-01-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

easyrdf_bad_02(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-bad-02-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-bad-02-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

easyrdf_bad_03(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-bad-03-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-bad-03-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

easyrdf_bad_04(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-bad-04-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-bad-04-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

easyrdf_bad_05(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-bad-05-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-bad-05-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

easyrdf_bad_06(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-bad-06-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-bad-06-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

easyrdf_good_01(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-01-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-01-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

easyrdf_good_02(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-02-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-02-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

easyrdf_good_03(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-03-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-03-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

easyrdf_good_04(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-04-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-04-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

easyrdf_good_05(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-05-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-05-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

easyrdf_good_06(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-06-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-06-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

easyrdf_good_07(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-07-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "easyrdf-good-07-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

node_rdf_01(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "node-rdf-01-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "node-rdf-01-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

node_rdf_02(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "node-rdf-02-b.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "node-rdf-02-a.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

ruby_rdf_match_test1(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test1-2.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test1-1.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

ruby_rdf_match_test2(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test2-2.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test2-1.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

ruby_rdf_match_test3(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test3-2.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test3-1.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

ruby_rdf_match_test4(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test4-2.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test4-1.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

ruby_rdf_match_test5(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test5-2.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test5-1.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

ruby_rdf_match_test6(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test6-2.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test6-1.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

ruby_rdf_match_test7(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test7-2.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-match-test7-1.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    true = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

ruby_rdf_nomatch_test1(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-nomatch-test1-2.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-nomatch-test1-1.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

ruby_rdf_nomatch_test2(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-nomatch-test2-2.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-nomatch-test2-1.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

ruby_rdf_nomatch_test3(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-nomatch-test3-2.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-nomatch-test3-1.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

ruby_rdf_nomatch_test4(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-nomatch-test4-2.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-nomatch-test4-1.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

ruby_rdf_nomatch_test5(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-nomatch-test5-2.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-nomatch-test5-1.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).

ruby_rdf_nomatch_test6(Config) ->
    Store1 = ?config(store1, Config),
    Store2 = ?config(store2, Config),
    {ok, File1} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-nomatch-test6-2.nt"),
                      [read]),
    {ok, File2} = file:open(
        filename:join(?config(data_dir, Config),
                              "ruby-rdf-nomatch-test6-1.nt"),
                      [read]),
    ok = lagra:parse(Store1, File1, ntriples, [allow_relative]),
    ok = lagra:parse(Store2, File2, ntriples, [allow_relative]),
    false = lagra:isomorphic(Store1, {iri, "urn:nil"}, Store2, {iri, "urn:nil"}).


all() ->
    [jena_iso_00, jena_iso_01, jena_iso_02, jena_iso_03, jena_iso_04, jena_iso_05, jena_iso_06, jena_iso_07, jena_iso_20, jena_iso_21, jena_iso_22, jena_iso_23, jena_iso_24, jena_iso_62, jena_iso_63, jena_iso_65, jena_iso_66, easyrdf_bad_01, easyrdf_bad_02, easyrdf_bad_03, easyrdf_bad_04, easyrdf_bad_05, easyrdf_bad_06, easyrdf_good_01, easyrdf_good_02, easyrdf_good_03, easyrdf_good_04, easyrdf_good_05, easyrdf_good_06, easyrdf_good_07, node_rdf_01, node_rdf_02, ruby_rdf_match_test1, ruby_rdf_match_test2, ruby_rdf_match_test3, ruby_rdf_match_test4, ruby_rdf_match_test5, ruby_rdf_match_test6, ruby_rdf_match_test7, ruby_rdf_nomatch_test1, ruby_rdf_nomatch_test2, ruby_rdf_nomatch_test3, ruby_rdf_nomatch_test4, ruby_rdf_nomatch_test5, ruby_rdf_nomatch_test6].

