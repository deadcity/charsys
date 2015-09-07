class Character < ActiveRecord::Base
	validates :user, :chronicle, :name, presence: true

	has_many :attribs
	has_many :character_has_attributes
	has_many :character_has_skills
	has_many :character_has_powers
	has_many :character_has_merits
	has_many :attribs, through: :character_has_attributes
	has_many :skills, through: :character_has_skills
	has_many :powers, through: :character_has_powers
	has_many :merits, through: :character_has_merits
	has_many :skill_specialties
	has_many :xp_records
	has_many :downtime_actions
	has_many :character_has_flaws
	has_many :flaws, through: :character_has_flaws
	belongs_to :lineage
	belongs_to :affiliation
	belongs_to :character_type
	belongs_to :behavior_primary
	belongs_to :behavior_secondary
	belongs_to :user
	belongs_to :chronicle

	accepts_nested_attributes_for :character_has_merits, allow_destroy: true
	accepts_nested_attributes_for :character_has_flaws, allow_destroy: true
	accepts_nested_attributes_for :character_has_powers, :skill_specialties, :downtime_actions, allow_destroy: true
end
