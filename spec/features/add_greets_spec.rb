require 'spec_helper'

feature "User adds a new greet" do 
	
	scenario "when browsing the homepage" do 
		expect(Greet.count).to eq(0)
		visit '/'
		add_greet("BigBoi69", "hey hey hey whatsup")
		expect(Greet.count).to eq(1)
		greet = Greet.first
		expect(greet.user_name).to eq("BigBoi69")
		expect(greet.body).to eq("hey hey hey whatsup")
	end

		def add_greet(user_name, body)
			within('#new-greet') do
				fill_in 'user_name', with: user_name
				fill_in 'body', with: body
				click_button 'Add Greet'
		end
	end
end