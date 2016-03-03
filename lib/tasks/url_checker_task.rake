desc "Checks all URLs from database that aren't completed"
#require 'url_checker.rb'

task :url_checker => :environment do
	Tasks.uncompleted.each do |t|
		flag = t.url_checker
		PostmanWorker.perform_async(t) if flag
	end
end