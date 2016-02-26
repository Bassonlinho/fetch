require 'spec_helper'

describe 'html_parser' do
	context "given a url" do
		it "parses a html website into text" do
			expect(UrlChecker.html_parser('https://en.wikipedia.org/wiki/Main_Page')).not_to be_empty
			#p(UrlChecker.html_parser('https://en.wikipedia.org/wiki/Main_Page'))
		end
	end
end

describe 'find_words_in_text' do
	context 'given a string of keywords and a string of text' do
		it 'searches for keywords in the text' do
			expect(UrlChecker.find_words_in_text(["one", "two", "three"], "one four five")).to be true
			expect(UrlChecker.find_words_in_text(["one", "two", "three"], "four five six")).to be false
		end
	end
end