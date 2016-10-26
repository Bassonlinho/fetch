require "rails_helper"


RSpec.describe UserMailer, type: :mailer do
	let(:mail) { UserMailer.registration('johndoe@hotmail.com') }

  it 'sends an email after user registration' do
  	expect(mail.body.encoded).to match(/Welcome to Notify by Kolosek.com we will let you know when your words come out on any website you want to track. Kind regards!/)
  	expect(mail.to).to eql(['johndoe@hotmail.com'])
  	expect(mail.from).to eql(['noreply@notify.kolosek.com'])
  end
end
