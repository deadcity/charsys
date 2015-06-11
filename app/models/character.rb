class Character < ActiveRecord::Base
	has_many :character_has_attributes
	has_many :character_has_skills
	has_many :character_has_powers
	has_many :skills, :through => :character_has_skills
	has_many :powers, :through => :character_has_powers
	has_one :character_type
	belongs_to :user
	belongs_to :chronicle
end
