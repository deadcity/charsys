class PowerType < ActiveRecord::Base
	has_many :power_groups
	has_many :character_type_has_power_types
	has_many :character_types, through: :character_type_has_power_types
end
