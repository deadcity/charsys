class SkillSpecialty < ActiveRecord::Base
	validates :skill, :specialty, presence: true
	
	belongs_to :character
	belongs_to :skill
end
