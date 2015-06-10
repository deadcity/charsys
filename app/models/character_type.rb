class CharacterType < ActiveRecord::Base
	has_many :chronicles, :through => :chronicle_allows_character_type
	has_many :power_types
	has_many :lineages
	has_many :affiliations
end
