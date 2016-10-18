desc "These tasks are called by the Heroku scheduler add-on"

task url_checker_task: :environment do
	@count = 0
	Task.where(status: 1).each do |t|
		@count += 1
		flag = t.url_check
		if flag
			#if PostmanWorker.perform_async(t.email)
			if VisitorMailer.contact_email(t.email, t.url).deliver_now
				t.status = 2
				t.save
			end
		end
	end
	p 'TOTAL NUMBER OF URL\'S: ' + Task.where(status: 1).all.count.to_s
	p 'TOTAL NUMBER OF URL\'S CHECKED: ' + @count.to_s
end