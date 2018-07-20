#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

NO_PAGES = [
  'Kategori:Stortingsrepresentanter 2017–2021',
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

IDs = %w(Q28481590 Q26848931 Q26848931)

no_names = NO_PAGES.map { |c| WikiData::Category.new(c, 'no').member_titles }.flatten.uniq
en_names = WikiData::Category.new('Category:Members of the Storting', 'en').member_titles

EveryPolitician::Wikidata.scrape_wikidata(ids: IDs, names: { no: no_names, en: en_names }, batch_size: 250)
