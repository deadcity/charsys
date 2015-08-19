class CharacterTypeHasBehaviorSecondary < ActiveRecord::Base
	belongs_to :character_type
	belongs_to :behavior_secondary
end