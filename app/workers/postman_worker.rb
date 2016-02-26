class PostmanWorker
  include Sidekiq::Worker

  def perform
    if VisitorMailer.contact_email(self.email).deliver_now
    	self.completed = true
    	self.save
    end
  end
end