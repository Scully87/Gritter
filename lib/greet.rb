class Greet

	include DataMapper::Resource

	has n, :Hashtags, :through => Resource

	property :id,        Serial
	property :user_name, String
	property :body,      Text

end