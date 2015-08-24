class AddExperienceRecords < ActiveRecord::Migration
  def change
  	create_table :xp_records do |t|
  		t.integer :character_id
  		t.integer :amount
  		t.string :note
  		t.timestamps
  	end
  end
end
