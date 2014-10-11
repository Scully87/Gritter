module SessionHelpers

	def sign_up(name = "Chris Peacock", user_name = 'BigBoi69', email = "bigboi69@example.com", password = "toilet1", password_confirmation = "toilet1")
		visit '/users/new'
		fill_in :name, with: name
		fill_in :user_name, with: user_name
		fill_in :email, with: email
		fill_in :password, with: password
		fill_in :password_confirmation, with: password_confirmation
		click_button "Sign up"
	end

end