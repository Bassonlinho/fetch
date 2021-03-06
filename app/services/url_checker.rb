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
		begin
			Nokogiri::HTML(open("#{url}", :allow_redirections => :safe).read).to_s
		rescue => e
			case e
			when OpenURI::HTTPError
				p 'OpenURI::HTTPError'
			when SocketError
				p 'SocketError'
			when Errno::ENOENT
				p 'Errno::ENOENT'
			else
				raise e
			end
		end
	end

	def self.find_words_in_text(words, text)
		if words.kind_of?(Array)
			words.each do |w| 
				if text.downcase.include? w.downcase
					return true
					break
				else
					return false
				end
			end

		elsif words.kind_of?(String)
			if words.include? ';'
				words = words.split(';')
				words.each do |w|
					if text.downcase.include? w.downcase.strip
						return true
						break
					else
						return false
					end
				end
			#case: single word (no ';', not an array)
		elsif text.downcase.include? words.downcase
			true
		else
			false
		end
	else
		return false
	end
end	
end