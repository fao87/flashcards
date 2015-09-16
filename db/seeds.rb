require 'open-uri'
require 'nokogiri'

source = 'http://www.study.ru/support/phrasebook/everyday.html#2'
# получаем содержимое веб-страницы в объект
page = Nokogiri::HTML(open(source))
# производим поиск по элементам с помощью css-выборки
page.css(".tableblue tr").each do |tr|
  #puts tr.text
  original_text = tr.css("td:first-child").text
  translated_text = tr.css("td:last-child").text
  review_date = Time.now
  card = Card.new
  card.original_text = original_text
  card.translated_text = translated_text
  card.review_date = review_date
  card.save
  #Card.create(:original_text, :translated_text, :review_date)
end





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
