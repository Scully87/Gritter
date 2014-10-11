class Hashtag

	include DataMapper::Resource

	has n, :Greet, :through => Resource

	property :id, Serial
	property :text, String

end