class ChangeTableNamesToActuallyWork < ActiveRecord::Migration
  def change
  	rename_table :character_type_has_lineage, :character_type_has_lineages
  	rename_table :character_type_has_affiliation, :character_type_has_affiliations
  end
end
