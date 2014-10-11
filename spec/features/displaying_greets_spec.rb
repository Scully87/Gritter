require 'spec_helper'

feature "User browses the display of greets" do 

	before(:each) {
		Greet.create(user_name: "BigBoi69",
								 body: "hey hey hey whatsup")
	}

	scenario "when opening the home page" do 
		visit '/'
		expect(page).to have_content("hey hey hey whatsup")
	end

end