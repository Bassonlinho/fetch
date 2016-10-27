require 'rails_helper'

describe "Tasks" do

  before :each do
    @task = FactoryGirl.create(:task)
    @task1 = FactoryGirl.create(:task,status: 3)
    @user = FactoryGirl.create(:user)
  end

  describe "POST #create" do
    it "when user is logged in" do
      login_as(@user, :scope => :user)
      visit tasks_path
      click_button("+ New Task")
      fill_in "task_url", :with => @task.url
      fill_in "task_words", :with => @task.words
      fill_in "task_email", :with => @task.words
      click_button("Create task")
      expect(page).to have_content("www.google.com")
    end
    it "when user not logged in" do
      visit root_path
      fill_in "task_url", :with => @task.url
      fill_in "task_words", :with => @task.words
      fill_in "task_email", :with => @task.email
      click_button("Submit tracking!")
      expect(page).to have_content("Task was successfully created!")
    end
  end



  describe "GET #index" do
    it "shows all tasks created by owner user" do
      login_as(@user, :scope => :user)
      visit tasks_path
      expect(page).to have_content("Time")
      expect(page).to have_content("URL")
      expect(page).to have_content("Keywords")
      expect(page).to have_content("Status")
      expect(page).to have_content("On/Off")
      expect(page).to have_content("Delete")
    end
  end


  describe "PUT #inactive" do
    it "changes tasks status to inactive" do
      login_as(@user, :scope => :user)
      visit tasks_path
      click_button("Off")
      expect(page).to have_content("Your task is now inactive!")
    end 
  end

  describe "PUT #active" do
    it "changes tasks status to active" do
      login_as(@user, :scope => :user)
      visit tasks_path
      click_button("On")
      expect(page).to have_content("Your task is now active!")
    end 
  end  

  describe "GET #show" do
    it "shows task with certain id" do
      login_as(@user, :scope => :user)
      visit task_path(@task)
      expect(page).to have_content("Task details")
    end
  end

  describe "DELETE #destroy" do
    it "deletes task from record" do
      login_as(@user, :scope => :user)
      visit tasks_path
      first('.delete').click
      expect(page).to have_content("Task was successfully destroyed.")
    end
  end

end