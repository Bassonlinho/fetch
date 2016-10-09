require 'rails_helper'

describe "Tasks" do

  before :each do
    @task = FactoryGirl.create(:task)
    @user = FactoryGirl.create(:user)
  end

 # describe "POST #create" do
  #  it "creates a task" do
   #   visit root_path
   #   save_and_open_page
    #  fill_in "task_url", :with => @task.url
    #  fill_in "task_words", :with => @task.words
    #  fill_in "task_email", :with => @task.email

     # click_button "Start Free Monitoring!"
     # get task_path('1')
     # expect(response).to render_template(:show)

    #end
  #end

  describe "GET #index" do
    it "shows all tasks created by owner user" do
      login_as(@user, :scope => :user)
      visit tasks_path
      expect(page).to have_content("List of your tasks:")
    end
  end


  describe "PUT #update" do
    it "changes tasks completed status" do
      login_as(@user, :scope => :user)
      visit tasks_path
      save_and_open_page
      check("task_completed")
      find('.task_completed').click
      expect(page).to have_content("true")
    end 
  end

  describe "DELETE #destroy" do
    it "deletes task from record" do
      login_as(@user, :scope => :user)
      visit tasks_path
      save_and_open_page
      click_on 'Delete'
      expect(page).to have_content("Task was successfully destroyed.")
    end
  end

end