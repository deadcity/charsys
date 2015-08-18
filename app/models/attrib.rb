class Attrib < ActiveRecord::Base
	has_many :characters, through: :character_has_attribute
	has_many :character_has_attributes
end