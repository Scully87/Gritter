require 'sinatra'
require 'data_mapper'
env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/gritter_#{env}")

require './lib/greet'
require './lib/hashtag'
require './lib/user'

DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'super secret'

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

# get '/hashtags/:text' do
# 	hashtag = Hashtag.first(text: params[:text])
# 	@greets = hashtag ? hashtag.greets : []
# 	erb :index
# end

get '/users/new' do
	erb :"users/new"
end

post '/users' do
	user = User.create(user_name: params[:user_name],
										 name: params[:name],
										 email: params[:email],
										 password: params[:password])
	session[:user_id] = user.id
	redirect to '/'
end

helpers do

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

end