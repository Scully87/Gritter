require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, 				Serial
	property :user_name, 		String, unique: true, message: "This user name is already taken"
	property :name, 			String
	property :email, 			String, unique: true, message: "This email is already taken"
	property :password_digest, 	Text
	has n, :greets, :through => Resource

	attr_reader :password 
	attr_accessor :password_confirmation

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	validates_confirmation_of :password, message: "Sorry, your passwords don't match"

	def self.authenticate(email, password)
		user = first(email: email)
		if user && BCrypt::Password.new(user.password_digest) == password
			user
		else
			nil
		end
	end
end