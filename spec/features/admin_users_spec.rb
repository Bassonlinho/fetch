require 'rails_helper'

describe "AdminUsers" do
	before :each do
		@adminuser = FactoryGirl.create(:admin_user)
	end

	describe "GET active_admin/sessions#new" do
    it "creates new session for admin user" do
      visit new_admin_user_session_path
      fill_in "admin_user_email", :with => @adminuser.email
      fill_in "admin_user_password", :with => @adminuser.password  
      click_button("Login")
      expect(page).to have_content("Signed in successfully.")
    end
  end
end