require 'spec_helper'

feature "User signs up" do
	
	scenario "when being logged out" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, BigBoi87")
		expect(User.first.user_name).to eq("BigBoi87")
	end

	def sign_up(user_name = "BigBoi87",
							name = "Chris Peacock",
							email = "BigBoi87@example.com",
							password = "toilet1")
		visit '/users/new'
		expect(page.status_code).to eq(200)
		fill_in :user_name, with: user_name
		fill_in :name, with: name
		fill_in :email, with: email
		fill_in :password, with: password
		click_button "Sign Up!"
	end

end