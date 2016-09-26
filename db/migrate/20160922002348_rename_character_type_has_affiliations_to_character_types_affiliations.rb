class RenameCharacterTypeHasAffiliationsToCharacterTypesAffiliations < ActiveRecord::Migration
  def change
  	rename_table :character_type_has_affiliations, :affiliations_character_types
  end
end
