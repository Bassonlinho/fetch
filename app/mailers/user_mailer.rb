class UserMailer < ActionMailer::Base

  # This method receives the data from the sucker punch job.
  def registration(user)
    @user = user

    mail to: @user.email,
         subject: 'Welcome!',
         from: 'noreply@notify.kolosek.com'
  end
end