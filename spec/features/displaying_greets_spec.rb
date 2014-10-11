require 'spec_helper'

feature "User browses the display of greets" do 

	before(:each) {
		Greet.create(user_name: "BigBoi69",
								 body: "last night's concert was a blast")
	}

	scenario "when opening the home page" do 
		visit '/'
		expect(page).to have_content("last night's concert was a blast")
	end

end