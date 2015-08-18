class Attrib < ActiveRecord::Base
	has_many :character_has_attributes
	has_many :characters, through: :character_has_attribute
end