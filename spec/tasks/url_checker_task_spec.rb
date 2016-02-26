require 'spec_helper'
require 'rake'

describe 'url_checker_task' do

  before do
    Rake.application.rake_require "tasks/url_checker_task"
    Rake::Task.define_task(:environment)
  end

  it "should run through Tasks and call url_checker on uncompleted ones" do
    Rake::Task["url_checker_task"].invoke
  end

end