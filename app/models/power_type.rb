class PowerType < ActiveRecord::Base
	has_many :powers
	belongs_to :character_type
end
