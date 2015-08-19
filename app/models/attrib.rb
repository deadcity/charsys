class Attrib < ActiveRecord::Base
	validates :name, presence: true
	
	has_many :character_has_attributes
	has_many :characters, through: :character_has_attribute
end