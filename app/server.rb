require 'sinatra'
require 'sinatra/partial'
require 'data_mapper'

require_relative 'data_mapper_setup'

require_relative 'models/link'

set :partial_template_engine, :erb

# class MyApp < Sinatra::Base
#   get '/' do
#     'Hello MyApp!'
#   end

#   # start the server if ruby file executed directly
#   run! if app_file == $0
# end
