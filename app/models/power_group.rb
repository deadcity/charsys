class PowerGroup < ActiveRecord::Base
	validates :name, presence: true
	
	belongs_to :power_type
	has_many :powers
end