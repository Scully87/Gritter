require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

# feature "User signs up" do
		
# 	scenario "when being logged out" do
# 		expect{ sign_up }.to change(User, :count).by(1)
# 		expect(page).to have_content("Welcome, BigBoi87")
# 		expect(User.first.user_name).to eq("BigBoi87")
# 	end

# 	scenario "a password that doesn't match" do
# 		expect{ sign_up('BigBoi87', "Chris Peacock", "BigBoi87@example.com", "toilet1", "wrongtoilet1")}.to change(User, :count).by(0)
# 		expect(current_path).to eq('/users')
# 		expect(page).to have_content("Sorry, your passwords don't match")
# 	end

# 	scenario "with an email that already exists" do
# 		expect{ sign_up }.to change(User, :count).by(1)
# 		expect{ sign_up }.to change(User, :count).by(0)
# 		expect(page).to have_content("This email address is already taken")
# 	end

# 	scenario "with a user name that already exists" do
# 		expect{ sign_up }.to change(User, :count).by(1)
# 		expect{ sign_up }.to change(User, :count).by(0)
# 		expect(page).to have_content("This user name is already taken")
# 	end

# end

feature "existing user signs back in" do

	before(:each){
		 User.create(user_name: "BigBoi87",
								password: "toilet1",
								password_confirmation: "toilet1")
	}
	
	scenario "with correct credentials" do
		visit '/'
		expect(page).not_to have_content("Welcome, BigBoi87")
		sign_in("BigBoi87", "toilet1")
		expect(page).to have_content("Welcome, BigBoi87")
	end

	scenario "with incorrect credentials" do
		visit '/'
		expect(page).not_to have_content("Welcome, BigBoi87")
		sign_in("BigBoi87", "wrongtoilet1")
		expect(page).not_to have_content("Welcome, BigBoi87")
	end

end

feature "existing user signs out" do

	before(:each){
		User.create(user_name: "BigBoi87",
								password: "toilet1",
								password_confirmation: "toilet1")
	}
	
	scenario "while being signed in" do
		sign_in("BigBoi87", "toilet1")
		click_button "Sign Out!"
		expect(page).to have_content("See you soon!")
		expect(page).not_to have_content("Welcome, BigBoi87")
	end

end