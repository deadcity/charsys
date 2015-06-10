class Chronicle < ActiveRecord::Base
	has_many :characters
	has_many :users, :through => :user_administers_chronicle
	has_many :character_types, :through => :chronicle_allows_character_type
end
