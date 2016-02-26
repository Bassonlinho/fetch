class Task < ActiveRecord::Base
	after_create :string_of_keywords_to_array

	scope :uncompleted, -> { where(completed: false) }

	def url_checker
	  UrlChecker.url_checker(self.words, self.url)
	end

	def string_of_keywords_to_array
	  self.words.split(";")
	  self.words.each do |w|
	    w.strip!
	  end
	end

end
