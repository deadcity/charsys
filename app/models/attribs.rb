class Attribs < ActiveRecord::Base
	belongs_to :attribute_category
	belongs_to :character, :through => :character_has_attribute
end
