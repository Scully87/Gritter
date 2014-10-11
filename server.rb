require 'sinatra'
require 'data_mapper'
env = ENV["RACK_ENV"] || "developement"
DataMapper.setup(:default, "postgres://localhost/gritter_#{env}")

require './lib/greet'
require './lib/hashtag'

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
	@greets = Greet.all 
	erb :index
end

post '/greets' do
	user_name = params["user_name"]
	body = params["body"]
	hashtags = params["hashtags"].split(" ").map { 
		|hashtags| Hashtag.first_or_create(:text => hashtags)
	 }
	Greet.create(user_name: user_name, body: body, hashtags: hashtags)
	redirect to ('/')
end