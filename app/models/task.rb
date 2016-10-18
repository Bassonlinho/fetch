class Task < ActiveRecord::Base
	before_save :string_of_keywords_to_array, :add_http_to_url
	belongs_to :user
	validates :url, :words, :email, presence: true

	
	scope :task_email_check, -> (user) {
		where("tasks.email =  ?", user.email)
	}

	STATUS_ACTIVE = 1.freeze
	STATUS_COMPLETED = 2.freeze
	STATUS_INACTIVE = 3.freeze

	STATUSES = {
		STATUS_ACTIVE => 'Active',
		STATUS_COMPLETED => 'Completed',
		STATUS_INACTIVE => 'Inactive'
	}
	

	def status_name
		STATUSES[status]
	end

	def active!
		self.status = STATUS_ACTIVE
		save!
	end

	def active?
		self.status == STATUS_ACTIVE
	end

	def inactive!
		self.status = STATUS_INACTIVE
		save!
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
