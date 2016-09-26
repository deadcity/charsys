class Lineage < ActiveRecord::Base
	validates :name, presence: true
	
	has_and_belongs_to_many :character_types
	has_many :characters
end
