class VisitorMailer < ApplicationMailer

  def contact_email(email)
    @email = email
    @message = "Your task is completed"
    mail(from: 'noreply@check-kolosek.com',
         to: @email,
         subject: 'Your task has been completed')
  end
end
