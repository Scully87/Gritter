env = ENV["RACK_ENV"] || "development"

require 'data_mapper'
require 'dm-migrations'

DataMapper.setup(:default, "postgres://localhost/gritter_#{env}")

require './app/models/link'
require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!
DataMapper.auto_migrate!