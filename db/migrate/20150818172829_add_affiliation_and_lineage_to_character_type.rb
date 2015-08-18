class AddAffiliationAndLineageToCharacterType < ActiveRecord::Migration
  def change
  	add_column :character_types, :lineage, :string
  	add_column :character_types, :affiliation, :string
  	add_column :character_types, :sublineage, :string
  end
end
