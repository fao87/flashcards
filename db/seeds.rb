require 'open-uri'
require 'nokogiri'

source = 'http://www.study.ru/support/phrasebook/everyday.html#2'
# получаем содержимое веб-страницы в объект
page = Nokogiri::HTML(open(source))
# производим поиск по элементам с помощью css-выборки
page.css(".tableblue tr").each do |tr|
  original_text = tr.css("td:first-child").text
  translated_text = tr.css("td:last-child").text
  Card.create(original_text: original_text, translated_text: translated_text) 
end

