desc "Checks all URLs from database that aren't completed"
#require 'url_checker.rb'

task :url_checker => :environment do
	Task.uncompleted.each do |t|
		flag = t.url_check
		PostmanWorker.perform_async(t) if flag
	end
end