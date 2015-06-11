class Skill < ActiveRecord::Base
	belongs_to :skill_category
	belongs_to :character
	belongs_to :character, :through => :character_has_skill
end
