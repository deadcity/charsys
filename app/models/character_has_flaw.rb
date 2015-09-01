class CharacterHasFlaw < ActiveRecord::Base
	belongs_to :character
	belongs_to :flaw
end