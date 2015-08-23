class BehaviorSecondary < ActiveRecord::Base
	validates :name, presence: true
	
	has_many :character_type_has_behavior_secondaries
	has_many :character_types, through: :character_type_has_behavior_secondaries
	has_many :characters
end