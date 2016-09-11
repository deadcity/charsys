require 'bcrypt'

class User < ActiveRecord::Base
	has_secure_password

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, :email, uniqueness: true, presence: true

	has_many :characters
	has_many :user_administers_chronicles
	has_many :chronicles, :through => :user_administers_chronicles

	def full_name
		"#{first_name} #{last_name}"
	end
end
