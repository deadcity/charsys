class AffiliationsCharacterType < ActiveRecord::Base
	belongs_to :character_type
	belongs_to :affiliation
end
