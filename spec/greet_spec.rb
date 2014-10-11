require 'spec_helper'

describe Greet do
  	
	context 'ensuring greets are being saved in the database' do
    
	 	it 'should be created then retrieved from the database' do
	 		expect(Greet.count).to eq(0)
	 		Greet.create(user_name: "BigBoi69",
	 								 body: "hey hey hey hey hows it hanging")
	 	  expect(Greet.count).to eq(1)
	 	  greet = Greet.first
	 	  expect(greet.user_name).to eq("BigBoi69")
	 	  expect(greet.body).to eq("hey hey hey hey hows it hanging")
	 	  greet.destroy
	 	  expect(greet.count).to eq(0)
	  end
	end
end	