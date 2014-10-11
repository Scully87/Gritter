require 'sinatra'
require 'data_mapper'
env = ENV["RACK_ENV"] || "developement"
DataMapper.setup(:default, "postgres://localhost/gritter_#{env}")

require './lib/greet'

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
	@greets = Greet.all 
	erb :index
end

post '/greets' do
	user_name = params["user_name"]
	body = params["body"]
	Greet.create(user_name: user_name, body: body)
	redirect to ('/')
end