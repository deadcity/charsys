class Power < ActiveRecord::Base
	validates :name, presence: true
	
	belongs_to :power_group
	has_one :power_type, through: :power_group
	has_many :characters, through: :character_has_power
end
