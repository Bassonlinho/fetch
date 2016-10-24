require 'rails_helper'

describe "Users" do

  before :each do
    @user = FactoryGirl.create(:user)
  end

  describe "GET registrations#new" do
    it "creates a new user and sends welcome email" do
      visit new_user_registration_path
      save_and_open_page
      fill_in "user_email", :with => "markking@hotmail.com"
      fill_in "user_password",:with => "markisking"
      fill_in "user_password_confirmation",:with => "markisking"
      expect {
        find('.btn-primary').click    
        }.to change{ ActionMailer::Base.deliveries.size}.by(1)
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end
    end

    describe "DELETE session#destroy" do
      it "destroy current user session" do
        login_as(@user, :scope => :user)
        visit tasks_path
        save_and_open_page
        find('.btn-primary').click
        expect(page).to have_content("Signed out successfully.")
      end
    end

    describe "GET sessions#new" do
      it "creates new session for user" do
        visit new_user_session_path
        fill_in "user_email", :with => @user.email
        fill_in "user_password", :with => @user.password  
        find('.btn-primary').click
        expect(page).to have_content("Signed in successfully.")
      end
    end

  end