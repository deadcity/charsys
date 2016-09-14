class PowerType < ActiveRecord::Base
	validates :name, presence: true
	
	has_and_belongs_to_many :power_groups
	has_and_belongs_to_many :character_types
	has_many :powers, through: :power_groups

	def to_s
		name
	end
end
