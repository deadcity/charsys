require 'bcrypt'

class User < ActiveRecord::Base
	has_secure_password

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, :email, uniqueness: true, presence: true

	has_many :characters
	has_and_belongs_to_many :chronicles

	def full_name
		"#{first_name} #{last_name}"
	end
end
