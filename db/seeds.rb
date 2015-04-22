# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(open("http://blogs.transparent.com/danish/2013/10/31/100-most-common-written-words-in-danish/"))
#open Url
doc.css('div > p + table tr')[1..100].each do |x|
  Card.create(original: x.css('td')[1].text.strip, translated: x.css('td')[2].text.strip)
end
#parsing words