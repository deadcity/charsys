class RemoveCharacterTypeIdFromPowerTypeAndCreateJoinTable < ActiveRecord::Migration
  def change
  	remove_column :power_types, :character_type_id
  	create_table :character_type_has_power_types do |t|
  		t.integer :character_type_id
  		t.integer :power_type_id
  	end
  end
end
