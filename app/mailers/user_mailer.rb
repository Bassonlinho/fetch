class UserMailer < ActionMailer::Base

  # This method receives the data from the sucker punch job.
  def registration(email)
    @email = email

    mail to: @email,
         subject: 'Welcome!',
         from: 'noreply@notify.kolosek.com'
  end
end