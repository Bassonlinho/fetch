require 'spec_helper'

  RSpec.describe 'PostmanWorker' do
	  it 'sends email' do
	    expect { PostmanWorker.perform_async("fedja@kolosek.com") }.to change(PostmanWorker.jobs, :size).by(1) 
	end
end