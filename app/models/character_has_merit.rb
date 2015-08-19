class CharacterHasMerit < ActiveRecord::Base
	belongs_to :character
	belongs_to :merit
end