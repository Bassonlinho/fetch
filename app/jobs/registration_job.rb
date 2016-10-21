class RegistrationJob 
  include SuckerPunch::Job
  
  def perform(email)
  	 UserMailer.registration(email).deliver_now
  end
end
