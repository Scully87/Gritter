require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, Serial
	property :user_name, String, unique: true, :message => "This user name is already taken"
	property :name, String
	property :email, String, unique: true, :message => "This email address is already taken"
	property :password_digest, Text

	attr_reader :password
	attr_accessor :password_confirmation

	validates_confirmation_of :password, :message => "Sorry, your passwords don't match"
	validates_uniqueness_of :user_name, :email

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

end