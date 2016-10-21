require 'spec_helper'

describe RegistrationJob, job: true do
	before :each do
		@user = FactoryGirl.create(:user)
	end
	describe "#perform" do

		it "delivers an email" do
			expect {
				RegistrationJob.new.perform(@user.email)
				}.to change{ ActionMailer::Base.deliveries.size }.by(1)
			end
		end
	end