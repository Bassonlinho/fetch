desc "These tasks are called by the Heroku scheduler add-on"

task url_checker_task: :environment do
	Task.uncompleted.each do |t|
		flag = t.url_check
		if flag
			#if PostmanWorker.perform_async(t.email)
			if VisitorMailer.contact_email(t.email, t.url).deliver_now
				t.completed = true
				t.save
			end
		end
	end
end