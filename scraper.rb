#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

# has Property: "Storting ID"
sparq = 'SELECT ?item WHERE { ?item wdt:P3072 [] }'
ids = EveryPolitician::Wikidata.sparql(sparq)
EveryPolitician::Wikidata.scrape_wikidata(ids: ids, batch_size: 100)
