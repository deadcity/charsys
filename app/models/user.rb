require 'bcrypt'

class User < ActiveRecord::Base
	has_secure_password

	validates :username, :name, presence: true
	validates :email, uniqueness: true, presence: true

	has_many :characters
	has_many :user_administers_chronicles
	has_many :chronicles, :through => :user_administers_chronicles
end
