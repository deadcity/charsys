class AddCharacterPowersTable < ActiveRecord::Migration
  def change
  	create_table :character_has_powers do |t|
  		t.integer :character_id
  		t.integer :power_id
  		t.timestamps
  	end
  end
end
