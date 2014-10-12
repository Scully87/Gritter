env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/gritter_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!