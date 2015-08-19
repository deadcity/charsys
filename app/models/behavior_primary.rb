class BehaviorPrimary < ActiveRecord::Base
	has_many :character_type_has_behavior_primaries
	has_many :character_types, through: :character_type_has_behavior_primary
end