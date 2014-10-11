class Hashtag

	include DataMapper::Resource

	has n, :greets, :through => Resource

	property :id,   Serial
	property :text, String

end