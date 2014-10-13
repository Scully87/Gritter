require 'dm-timestamps'
require 'dm-validations'

class Greet

	include DataMapper::Resource

	property :id,         Serial
	property :body,       String, length: 1..50
	property :user_name,  String
	property :name, 	  String
	property :created_at, DateTime

	has 1, :user, :through => Resource

end