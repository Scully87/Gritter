require 'spec_helper'

feature "User signs up" do

	before(:each) do 
	  User.create(name: 'Chris Peaccock',
	  						user_name: 'BigBoi69',
	  						email: 'bigboi69@example.com',
	  			  		password: 'toilet1',
	  			  		password_confirmation: 'toilet1')
	end

	scenario "when opening the homepage" do
		visit '/'
		expect(page).to have_content("Welcome to Gritter!")
	end
	
	scenario "when being logged out" do
		expect { sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Howdy, BigBoi69")
		expect(User.first.user_name).to eq("BigBoi69")	
	end


	def sign_up(name = 'Chris Peacock', user_name = 'BigBoi69', email = "bigboi69@example.com", password = "toilet1", password_confirmation = "toilet1")
		visit '/users/new'
		fill_in :name, with: name
		fill_in :user_name, with: user_name
		fill_in :email, with: email
		fill_in :password, with: password
		fill_in :password_confirmation, with: password_confirmation
		click_button "Sign up"
	end

end