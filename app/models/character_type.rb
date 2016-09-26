class CharacterType < ActiveRecord::Base
	validates :name, presence: true
	validates :status, presence: true

	has_many :chronicles
	has_many :characters
	has_many :chronicle_allows_character_types
	has_many :chronicles, :through => :chronicle_allows_character_types
	has_and_belongs_to_many :power_types
	has_and_belongs_to_many :lineages
	has_and_belongs_to_many :affiliations
	has_many :character_type_has_behavior_primaries
	has_many :character_type_has_behavior_secondaries
	has_many :behavior_primaries, through: :character_type_has_behavior_primaries
	has_many :behavior_secondaries, through: :character_type_has_behavior_secondaries
	has_many :flaws


	def show_status
		status ? 'Active' : 'Inactive'
	end

	def has_integrity_modifiers
		self.morality == 'Integrity' ? true : false
	end

	def to_s
		name
	end
end
