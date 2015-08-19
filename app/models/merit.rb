class Merit < ActiveRecord::Base
	has_many :character_has_merits
	has_many :characters, through: :character_has_merit
end