class CharacterTypesLineage < ActiveRecord::Base
	belongs_to :character_type
	belongs_to :lineage
end
