class Skill < ActiveRecord::Base
	belongs_to :skill_category
	has_many :character
	has_many :character, :through => :character_has_skill
end
