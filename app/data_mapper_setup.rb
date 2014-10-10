env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/gritter_#{env}")

require './app/models/link'

DataMapper.finalize
DataMapper.auto_upgrade!