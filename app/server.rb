require 'sinatra'
require 'sinatra/partial'
require 'data_mapper'

require_relative 'data_mapper_setup'

require_relative 'models/link'
require_relative 'models/user'

enable :sessions
set :session_secret, 'super secret'

set :partial_template_engine, :erb

get '/' do
  erb :index
end

post '/users' do
  user = User.create(name: params[:name],
  					 user_name: params[:user_name],
  					 email: parmas[:email],
  					 password: params[:password])
  session[:user_id] = user.id
  redirect to('/')
end
# class MyApp < Sinatra::Base
#   get '/' do
#     'Hello MyApp!'
#   end

#   # start the server if ruby file executed directly
#   run! if app_file == $0
# end
