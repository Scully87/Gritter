require 'spec_helper'

feature "User signs up" do
		
	scenario "when being logged out" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, BigBoi87")
		expect(User.first.user_name).to eq("BigBoi87")
	end

	scenario "a password that doesn't match" do
		expect{ sign_up('BigBoi87', "Chris Peacock", "BigBoi87@example.com", "toilet1", "wrongtoilet1")}.to change(User, :count).by(0)
		expect(current_path).to eq('/users')
		expect(page).to have_content("Sorry, your passwords don't match")
	end

	def sign_up(user_name = "BigBoi87",
							name = "Chris Peacock",
							email = "BigBoi87@example.com",
							password = "toilet1",
							password_confirmation = "toilet1")
		visit '/users/new'
		fill_in :user_name, with: user_name
		fill_in :name, with: name
		fill_in :email, with: email
		fill_in :password, with: password
		fill_in :password_confirmation, with: password_confirmation
		click_button "Sign Up!"
	end

end