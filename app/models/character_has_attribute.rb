class CharacterHasAttribute < ActiveRecord::Base
	belongs_to :attribute
	belongs_to :character
end
