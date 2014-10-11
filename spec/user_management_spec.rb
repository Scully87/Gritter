require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User signs up" do

	# before(:each) do 
	#   User.create(name: 'Chris Peaccock',
	#   			  user_name: 'BigBoi69',
	#   			  email: 'bigboi69@example.com',
	#   			  password: 'toilet1',
	#   			  password_confirmation: 'toilet1')
	# end
	
	scenario "when being logged out" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Howdy, BigBoi69")
		expect(User.first.user_name).to eq("BigBoi69")
		expect(User.first.email).to eq("bigboi69@example.com")
		expect(User.first.name).to eq("Chris Peakcock")	
	end

	scenario "with a password that doesn't match" do
		expect{ sign_up ('BigBoi69', 'bigboi69@example.com', "Chris Peacock", 'toilet1', 'wrongtoilet1')}.to change(User, :count).by(0)
		expect(current_path).to eq('/users')
		exepct(page.to have_content("Sorry, your passwords do not match")
	end

	scenario "with a user name that is already registered" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect{ sign_up }.to change)User, :count).by(0)
		expect(page).to have_content("Sorry this user name is already taken")
	end

	scenario "with an email address that is already registered" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect{ sign_up }.to change)User, :count).by(0)
		expect(page).to have_content("Sorry this email address is already taken")
	end

end