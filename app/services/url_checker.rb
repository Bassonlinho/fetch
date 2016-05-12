require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'

module UrlChecker

	def self.url_checker(words, url)
	  	text = html_parser(url)
	  	if find_words_in_text(words, text)
	  		p 'found keywords - true'
	  		return true
	  	else
	  		p 'no keywords found - false'
	  		return false
	  	end
	end

	private

	def self.html_parser(url)
		Nokogiri::HTML(open("#{url}", :allow_redirections => :safe).read).to_s
	end

	def self.find_words_in_text(words, text)
		if words.kind_of?(Array)
			words.each do |w| 
				#text.match(/#{w}/) ? true : false
				if text.downcase.include? w.downcase
					return true
					break
				else
					return false
				end
			end
		elsif words.kind_of?(String)
			p 'on line 40 in url_checker.rb'
			#text.match(/words/) ? true : false
			if text.downcase.include? words.downcase
				p 'on line 43 in url_checker.rb'
				true
			else
				p 'on line 46 in url_checker.rb'
				false
			end
		else
			p 'on line 50 in url_checker.rb'
			return true
		end
	end	
end