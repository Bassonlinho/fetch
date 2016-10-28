require 'spec_helper'

describe RegistrationWorker, job: true do
	before :each do
		@user = FactoryGirl.create(:user)
	end
	describe "#perform" do

		it "delivers an email" do
			expect {
				RegistrationWorker.perform_async(@user.email)
				}.to change{ ActionMailer::Base.deliveries.size }.by(1)
			end
		end
	end