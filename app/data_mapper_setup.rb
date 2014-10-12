env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/gritter_#{env}")
require './lib/greet'
require './lib/user'
DataMapper.finalize
DataMapper.auto_upgrade!