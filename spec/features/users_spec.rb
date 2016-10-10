require 'rails_helper'

describe "Users" do

  before :each do
    @task = FactoryGirl.create(:task)
    @user = FactoryGirl.create(:user)
  end

  describe "GET #new" do
    it "creates a new user" do
      visit new_user_registration_path
      save_and_open_page
      fill_in "user_email", :with => "markking@hotmail.com"
      fill_in "user_password",:with => "markisking"
      fill_in "user_password_confirmation",:with => "markisking"
      find('.btn-primary').click
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
  
end