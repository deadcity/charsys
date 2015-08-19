class Character < ActiveRecord::Base
	validates :user, :chronicle, :name, presence: true

	has_many :attribs
	has_many :character_has_attributes
	has_many :character_has_skills
	has_many :character_has_powers
	has_many :character_has_merits
	has_many :attrib, :through => :character_has_attributes
	has_many :skills, :through => :character_has_skills
	has_many :powers, :through => :character_has_powers
	has_many :merits, through: :character_has_merit
	has_one :character_type
	belongs_to :user
	belongs_to :chronicle

	accepts_nested_attributes_for :skills, :powers, :attribs
end
