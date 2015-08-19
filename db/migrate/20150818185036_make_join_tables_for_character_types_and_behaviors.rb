class MakeJoinTablesForCharacterTypesAndBehaviors < ActiveRecord::Migration
  def change
  	create_table :character_type_has_behavior_primaries do |t|
  		t.integer :character_type_id
  		t.integer :behavior_primary_id
  	end

  	create_table :character_type_has_behavior_secondaries do |t|
  		t.integer :character_type_id
  		t.integer :behavior_secondary_id
  	end
  end
end
