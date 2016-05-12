class VisitorMailer < ApplicationMailer

  def contact_email(email, url)
    @email = email
    @url = url
    @message = "Your task is completed"
    mail(from: 'noreply@notify.kolosek.com',
         to: @email,
         subject: 'Your task has been completed')
  end
end
