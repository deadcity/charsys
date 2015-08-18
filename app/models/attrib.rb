class Attrib < ActiveRecord::Base
	belongs_to :character, through: :character_has_attribute
	belongs_to :character_has_attribute
end