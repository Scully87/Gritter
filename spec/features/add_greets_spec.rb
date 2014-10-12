require 'spec_helper'

feature "User adds a new greet" do 

	scenario "when browsing the homepage" do 
		expect(Greet.count).to eq(0)
		visit '/'
		add_greet("last night's concert was a blast")
		expect(Greet.count).to eq(1)
		greet = Greet.first
		expect(greet.user_name).to eq("BigBoi69")
		expect(greet.body).to eq("last night's concert was a blast")
	end

	scenario "with a few hash tags" do
		visit '/'
		add_greet("last night's concert was a blast", ['music', 'yesterday'])
		greet = Greet.first
		expect(greet.hashtags.map(&:text)).to include("music")
		expect(greet.hashtags.map(&:text)).to include("yesterday")
	end

		def add_greet(greet, hashtags = [])
			within('#new-greet') do
				# fill_in 'user_name', with: user_name
				fill_in 'greet', with: greet
				fill_in 'hashtags', with: hashtags.join(' ')
				click_button 'Add Greet'
		end
	end
end