class Flaw < ActiveRecord::Base
	belongs_to :character_type
	has_many :character_has_flaws
	has_many :characters, through: :character_has_flaws
end