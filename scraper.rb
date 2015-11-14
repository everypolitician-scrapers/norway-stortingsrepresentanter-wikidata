#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'
require 'rest-client'

@pages = [
  'Kategori:Stortingsrepresentanter 2013–2017',
  'Kategori:Stortingsrepresentanter 2009–2013',
  'Kategori:Stortingsrepresentanter 2005–2009',
  'Kategori:Stortingsrepresentanter 2001–2005',
  'Kategori:Stortingsrepresentanter 1997–2001',
  'Kategori:Stortingsrepresentanter 1993–1997',
  'Kategori:Stortingsrepresentanter 1989–1993',
  'Kategori:Stortingsrepresentanter 1985–1989',
  'Kategori:Stortingsrepresentanter 1981–1985',
  'Kategori:Stortingsrepresentanter 1977–1981',
  'Kategori:Stortingsrepresentanter 1973–1977',
  'Kategori:Stortingsrepresentanter 1969–1973',
  'Kategori:Stortingsrepresentanter 1965–1969',
  'Kategori:Stortingsrepresentanter 1961–1965',
  'Kategori:Stortingsrepresentanter 1958–1961',
  'Kategori:Stortingsrepresentanter 1954–1957',
  'Kategori:Stortingsrepresentanter 1950–1953',
  'Kategori:Stortingsrepresentanter 1945–1949',
]

@pages.map { |c| WikiData::Category.new(c, 'no').wikidata_ids }.flatten.uniq.each_with_index do |id, i|
  puts i if (i % 100).zero?
  data = WikiData::Fetcher.new(id: id).data('no', 'nb', 'nn') or next
  # puts "%s %s" % [data[:id], data[:name]]
  ScraperWiki.save_sqlite([:id], data)
end

warn RestClient.post ENV['MORPH_REBUILDER_URL'], {} if ENV['MORPH_REBUILDER_URL']

