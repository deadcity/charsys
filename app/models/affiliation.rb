class Affiliation < ActiveRecord::Base
	validates :name, presence: true
	
	belongs_to :character_type
end
