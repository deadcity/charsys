class RemoveCharacterTypeFromAffiliationsAndLineagesAndAddJoinTable < ActiveRecord::Migration
  def change
  	remove_column :lineages, :character_type_id
  	remove_column :affiliations, :character_type_id
  	create_table :character_type_has_lineage do |t|
  		t.integer :character_type_id
  		t.integer :lineage_id
  	end
  	create_table :character_type_has_affiliation do |t|
  		t.integer :character_type_id
  		t.integer :affiliation_id
  	end
  end
end
