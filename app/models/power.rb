class Power < ActiveRecord::Base
	validates :name, presence: true
	
	belongs_to :power_group
end
