require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'

module UrlChecker

	def self.url_checker(words, url)
	  	text = html_parser(url)
	  	find_words_in_text(words, text) ? true : false
	end

	private

	def self.html_parser(url)
		Nokogiri::HTML(open("#{url}").read).to_s
	end

	def self.find_words_in_text(words, text)
		if words.kind_of?(Array)
			words.each do |w| 
				#text.match(/#{w}/) ? true : false
				if text.include? w
					return true
					break
				else
					return false
				end
			end
		elsif words.kind_of?(String)
			#text.match(/words/) ? true : false
			if text.include? words
				true
			else
				false
			end
		end
	end	
end