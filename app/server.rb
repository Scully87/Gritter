require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash 

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
	@user = User.new
	erb :"users/new"
end

post '/users' do
	@user = User.create(user_name: params[:user_name],
										 name: params[:name],
										 email: params[:email],
										 password: params[:password],
										 password_confirmation: params[:password_confirmation])
	if @user.save
		session[:user_id] = @user.id
		redirect to '/'
	else
		flash.now[:errors] = @user.errors.full_messages
		erb :"users/new"
	end
end

get '/sessions/new' do
	erb :"sessions/new"
end

post '/sessions' do
	user_name, password = params[:user_name], params[:password]
	user = User.authenticate(user_name, password)
	if user
		session[:user_id] = user.id
		redirect to ('/')
	else
		flash[:errors] = ["The User Name or Password is incorrect"]
		erb :"sessions/new"
	end
end	