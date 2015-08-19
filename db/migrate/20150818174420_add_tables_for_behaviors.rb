class AddTablesForBehaviors < ActiveRecord::Migration
  def change
  	create_table :behavior_primaries do |t|
  		t.string :name
  	end
  	create_table :behavior_secondaries do |t|
  		t.string :name
  	end
  end
end
