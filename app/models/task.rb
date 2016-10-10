class Task < ActiveRecord::Base
	before_save :string_of_keywords_to_array, :add_http_to_url
	belongs_to :user
	validates :url, :words, :email, presence: true

	scope :uncompleted, -> { where(completed: false) }
	
	scope :email_check, -> (user) {
		where("tasks.email =  ?", user.email)
	}

	def task_check
		completed ? 'Completed' : 'Monitoring'
	end
	
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

	def add_http_to_url
		unless self.url.match(/^(http|https):\/\//).present?
			self.url = "http://#{self.url}"
		end
	end

end
