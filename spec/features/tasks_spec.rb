require 'rails_helper'

describe "Tasks" do

  before :each do
    @task = FactoryGirl.create(:task)
    @task1 = FactoryGirl.create(:task,status: 3)
    @user = FactoryGirl.create(:user)
  end

  describe "POST #create" do
    it "creates a task" do
      visit root_path
      save_and_open_page
      fill_in "task_url", :with => @task.url
      fill_in "task_words", :with => @task.words
      fill_in "task_email", :with => @task.email
      
      expect{find('.btn-success').click}.to change(Task,:count).by(1)
    end
  end

  describe "GET #index" do
    it "shows all tasks created by owner user" do
      login_as(@user, :scope => :user)
      visit tasks_path
      expect(page).to have_content("List of your tasks:")
    end
  end


  describe "PUT #inactive" do
    it "changes tasks status to inactive" do
      login_as(@user, :scope => :user)
      visit tasks_path
      save_and_open_page
      find('.task_inactive').click
      expect(page).to have_content("Inactive")
    end 
  end

  describe "PUT #active" do
    it "changes tasks status to active" do
      login_as(@user, :scope => :user)
      visit tasks_path
      save_and_open_page
      find('.task_active').click
      expect(page).to have_content("Active")
    end 
  end  

  describe "GET #show" do
    it "shows task with certain id" do
      login_as(@user, :scope => :user)
      visit task_path(@task)
      save_and_open_page
      expect(page).to have_content("Task details")
    end
  end

  describe "DELETE #destroy" do
    it "deletes task from record" do
      login_as(@user, :scope => :user)
      visit tasks_path
      save_and_open_page
      first('.delete').click
      expect(page).to have_content("Task was successfully destroyed.")
    end
  end

end