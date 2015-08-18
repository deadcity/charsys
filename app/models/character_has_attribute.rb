class CharacterHasAttribute < ActiveRecord::Base
	belongs_to :attrib
	belongs_to :character
end
