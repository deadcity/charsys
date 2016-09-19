class PowerGroup < ActiveRecord::Base
	validates :name, presence: true
	
	has_and_belongs_to_many :power_types
	has_many :powers
end