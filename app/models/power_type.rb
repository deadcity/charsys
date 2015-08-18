class PowerType < ActiveRecord::Base
	has_many :power_groups
	belongs_to :character_type_has_power_type
	belongs_to :character_type, through: :character_type_has_power_type
end
