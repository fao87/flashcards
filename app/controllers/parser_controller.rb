class ParserController < ApplicationController
  require 'open-uri'

  require 'nokogiri'
  
  def translate_words
  	source = 'http://www.study.ru/support/phrasebook/everyday.html#2'
  	# получаем содержимое веб-страницы в объект
  	page = Nokogiri::HTML(open(source.to_s + page))

  	# производим поиск по элементам с помощью css-выборки
    page.css('tableblue').each do |link|

      Card.create()

    end

  end

end
