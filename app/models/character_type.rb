class CharacterType < ActiveRecord::Base
	validates :name, presence: true

	has_many :chronicles
	has_many :chronicle_allows_character_types
	has_many :chronicles, :through => :chronicle_allows_character_types
	has_many :character_type_has_power_types
	has_many :power_types, through: :character_type_has_power_types
	has_many :character_type_has_lineages
	has_many :lineages, through: :character_type_has_lineages
	has_many :character_type_has_affiliations
	has_many :affiliations, through: :character_type_has_affiliations
	has_many :character_type_has_behavior_primaries
	has_many :character_type_has_behavior_secondaries
	has_many :behavior_primaries, through: :character_type_has_behavior_primaries
	has_many :behavior_secondaries, through: :character_type_has_behavior_secondaries
end
