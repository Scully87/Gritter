class Greet

	include DataMapper::Resource

	property :id,        Serial
	property :user_name, String
	property :body,      Text

end