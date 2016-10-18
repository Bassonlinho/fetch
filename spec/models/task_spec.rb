require 'spec_helper'

describe Task do

  it { should have_db_column(:url).of_type(:string) }
  it {should have_db_column(:words).of_type(:string)}
  it {should have_db_column(:email).of_type(:string)}
  it {should have_db_column(:status).of_type(:integer)}
  it {should have_db_column(:created_at).of_type(:datetime)}
  it {should have_db_column(:updated_at).of_type(:datetime)}

  before :each do
    @task = FactoryGirl.create(:task)
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(@task).to be_valid
    end

    it "is not valid without url" do
      @task.url = nil
      expect(@task).to_not be_valid
    end

    it "is not valid without words" do
      @task.words = nil
      expect(@task).to_not be_valid
    end

    it "is not valid without email" do
      @task.email = nil
      expect(@task).to_not be_valid
    end
  end

  describe "Status" do
    it "changes tasks status to inactive" do
      @task.inactive!
      expect(@task.status).to be 3
    end
    it "changes tasks status to active" do
      @task.status = 3
      @task.active!
      expect(@task.status).to be 1
    end
  end

  describe ".add_http_to_url" do
    it "adds http to url if not present" do
      @task.url = "google.com"
      expect{@task.add_http_to_url}.to change(@task,:url).from("google.com").to("http://google.com")
    end
  end
  
end