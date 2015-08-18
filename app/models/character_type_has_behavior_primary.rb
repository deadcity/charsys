class CharacterTypeHasBehaviorPrimary < ActiveRecord::Base
	belongs_to :character_type
	belongs_to :behavior_primary
end