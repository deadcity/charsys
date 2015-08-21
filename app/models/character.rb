class Character < ActiveRecord::Base
	validates :user, :chronicle, :name, presence: true

	has_many :attribs
	has_many :character_has_attributes
	has_many :character_has_skills
	has_many :character_has_powers
	has_many :character_has_merits
	has_many :attribs, :through => :character_has_attributes
	has_many :skills, :through => :character_has_skills
	has_many :powers, :through => :character_has_powers
	has_many :merits, through: :character_has_merits
	has_many :skill_specialties
	belongs_to :lineage
	belongs_to :affiliation
	belongs_to :character_type
	belongs_to :user
	belongs_to :chronicle

	accepts_nested_attributes_for :character_has_powers, :character_has_merits, :skill_specialties, allow_destroy: true
end
