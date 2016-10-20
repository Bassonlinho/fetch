class RegistrationJob 
  include SuckerPunch::Job
  
  def perform(user)
  	 UserMailer.registration(user).deliver_now
  end
end
