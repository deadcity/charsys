class CharacterTypeHasPowerType < ActiveRecord::Base
	belongs_to :character_type
	belongs_to :power_type
end