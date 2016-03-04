class PostmanWorker
  include Sidekiq::Worker

  def perform(email)
    VisitorMailer.contact_email(email).deliver_now
  end
end