class CharacterHasPower < ActiveRecord::Base
	belongs_to :power
	belongs_to :character
end