require 'nokogiri'
require 'open-uri'

module UrlChecker

	def url_checker(words, url)
	  	text = html_parser(url)
	  	find_words_in_text(words, text) ? true : false
	end

	private

	def self.html_parser(url)
		Nokogiri::HTML(open("#{url}").read).to_s
	end

	def self.find_words_in_text(words, text)
		words.each { |w| text.match(/#{w}/) ? true : false }
	end	
end