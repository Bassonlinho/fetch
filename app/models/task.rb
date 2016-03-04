class Task < ActiveRecord::Base
	after_create :string_of_keywords_to_array

	scope :uncompleted, -> { where(completed: false) }

	def url_check
	  UrlChecker.url_checker(self.words, self.url)
	end

	def string_of_keywords_to_array
	  self.words.split(";")
	  if words.kind_of?(Array)
	  	self.words.each do |w|
	    	w.strip!
	  	end
	  elsif words.kind_of?(String)
	  	words.strip!
	  end
	  words
	end

end
