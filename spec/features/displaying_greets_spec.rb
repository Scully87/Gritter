require 'spec_helper'

feature "User browses the display of greets" do 

	before(:each) {
		Greet.create(user_name: "BigBoi69",
					 body: "last night's meal was delicious",
					 hashtags: [Hashtag.first_or_create(text:"food")])
	}

	scenario "when opening the home page" do 
		visit '/'
		expect(page).to have_content("last night's meal was delicious")
	end

	# scenario "filtered by a hashtag" do
	# 	visit '/hashtags/search'	
	# 	expect(page).not_to have_content("BigBoi69")
	# 	expect(page).to have_content("last night's meal was delicious")
	# end
end