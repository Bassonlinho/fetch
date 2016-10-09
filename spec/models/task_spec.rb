require 'spec_helper'

describe 'task model' do

	before :each do
		@task = FactoryGirl.create(:task)
	end

#	context 'given a string of keywords' do
#		it 'splits keywords into array of words with no whitespace' do
#			expect { @task.string_of_keywords_to_array }.to change(task, :words).from("nemanja ristic").to(["nemanja", "ristic"])

#			#expect { object.action }.to change(object, :value).from(old).to(new)
#		end
#	end
end