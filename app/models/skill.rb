class Skill < ActiveRecord::Base
	validates :name, presence: true
	
	belongs_to :skill_category
	has_many :character
	has_many :character, :through => :character_has_skill
	has_many :skill_specialties
end
