require "rails_helper"

RSpec.describe VisitorMailer, type: :mailer do
  let(:mail) { VisitorMailer.contact_email('test@test.com') }

  #pending "add some examples to (or delete) #{__FILE__}"
  	it 'sends an email informing the user the task is complete' do
  	  expect(mail.body.encoded).to match(/Your task is completed/)
  	  expect(mail.to).to eql(['test@test.com'])
  	  expect(mail.from).to eql(['fedja@kolosek.com'])
  	  #p(mail.body.encoded)
  	end
end
