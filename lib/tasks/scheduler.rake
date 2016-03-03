desc "This task is called by the Heroku scheduler add-on"

task :url_checker => :environment do
	Tasks.uncompleted.each do |t|
		flag = t.url_checker
		PostmanWorker.perform_async(t) if flag
	end
end