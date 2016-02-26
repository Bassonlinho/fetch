require 'spec_helper'

describe 'task model' do

	task = build[:task]

	context 'given a string of keywords' do
		it 'splits keywords into array of words with no whitespace' do
			expect { task.string_of_keywords_to_array }.to change(task, :words).from("one two three").to(["one", "two", "three"])

			#expect { object.action }.to change(object, :value).from(old).to(new)
		end
	end
end