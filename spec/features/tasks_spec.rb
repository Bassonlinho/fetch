require 'rails_helper'

describe "Tasks" do
  
  describe "CREATE /tasks" do
    it "creates a task" do
      visit new_task_path

      fill_in "Url", :with => "testUrl"
      fill_in "Words", :with => "testWords"
      fill_in "Email", :with => "testEmail"

      expect{ click_button "Create Task" }.to change(Task, :count).by(1)

      expect(page).to have_content("Task was successfully created")
    end
  end
end