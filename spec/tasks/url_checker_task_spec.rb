require 'spec_helper'
require 'rake'

describe 'url_checker_task' do

	before do
		load File.expand_path("../../../lib/tasks/scheduler.rake", __FILE__)
		Rake::Task.define_task(:environment)
	end

	it "should run through Tasks and call url_checker on uncompleted ones" do
		Rake::Task["url_checker_task"].invoke
	end
end