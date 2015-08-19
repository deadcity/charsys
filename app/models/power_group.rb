class PowerGroup < ActiveRecord::Base
	belongs_to :power_type
	has_many :powers
end