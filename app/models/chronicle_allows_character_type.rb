class ChronicleAllowsCharacterType < ActiveRecord::Base
	belongs_to :chronicle
	belongs_to :character_type
end
