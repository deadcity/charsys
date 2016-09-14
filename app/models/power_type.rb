class PowerType < ActiveRecord::Base
	validates :name, presence: true
	
	has_and_belongs_to_many :power_groups
	has_many :character_type_has_power_types
	belongs_to :character_type
	has_many :character_types, through: :character_type_has_power_types
	has_many :powers, through: :power_groups

	def to_s
		name
	end
end
