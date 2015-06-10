require 'bcrypt'

class User < ActiveRecord::Base
	has_secure_password

	has_many :characters
	has_many :chronicles, :through => :user_administers_chronicle
end
