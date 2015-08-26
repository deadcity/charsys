class AddDowntimeTables < ActiveRecord::Migration
  def change
  	create_table :downtime_actions do |t|
  		t.integer :character_id
  		t.integer :game_id
  		t.string :title
  		t.string :points_spent
  		t.string :assets
  		t.text :description
  	end

  	create_table :games do |t|
  		t.integer :chronicle_id
  		t.integer :game_number
  		t.string :title
  	end
  end
end
