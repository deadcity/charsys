class SkillCategory < ActiveRecord::Base
	validates :name, presence: true
	
	has_many :skills
end
