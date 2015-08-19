class Lineage < ActiveRecord::Base
	validates :name, presence: true
	
	has_many :character_type_has_lineages
	has_many :character_types, through: :character_type_has_lineage
end
