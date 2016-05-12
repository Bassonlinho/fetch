desc "These tasks are called by the Heroku scheduler add-on"

task url_checker_task: :environment do
	p 'on line 4 in url_checker_task'
	Task.uncompleted.each do |t|
		p 'on line 6 in url_checker_task'
		flag = t.url_check
		if flag
			p 'on line 9 in url_checker_task'
			#if PostmanWorker.perform_async(t.email)
			if VisitorMailer.contact_email(t.email, t.url).deliver_now
				p 'on line 12 in url_checker_task'
				t.completed = true
				t.save
			end
		end
	end
end