class ChangeBehaviorIdsToIntegers < ActiveRecord::Migration
  def change
  	remove_column :characters, :behavior_primary_id
  	remove_column :characters, :behavior_secondary_id
  	add_column :characters, :behavior_primary_id, :integer
  	add_column :characters, :behavior_secondary_id, :integer
  end
end
