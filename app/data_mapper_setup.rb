env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://pbnsrezronvvkk:9DM3MVSNG38cf6Fbw4pl2Nbm8O@ec2-54-243-44-191.compute-1.amazonaws.com:5432/d4214lc09qdcfa")

DataMapper.finalize

DataMapper.auto_upgrade!