class CharacterType < ActiveRecord::Base
	validates :name, presence: true

	has_many :chronicles
	has_many :chronicles, :through => :chronicle_allows_character_type
	has_many :chronicle_allows_character_type
	has_many :character_type_has_power_types
	has_many :power_types, through: :character_type_has_power_type
	has_many :character_type_has_lineages
	has_many :lineages, through: :character_type_has_lineage
	has_many :character_type_has_affiliations
	has_many :affiliations, through: :character_type_has_affiliation
	has_many :character_type_has_behavior_primaries
	has_many :character_type_has_behavior_secondaries
	has_many :behavior_primaries, through: :character_type_has_behavior_primary
	has_many :behavior_secondaries, through: :character_type_has_behavior_secondary
end
