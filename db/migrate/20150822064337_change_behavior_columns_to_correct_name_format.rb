class ChangeBehaviorColumnsToCorrectNameFormat < ActiveRecord::Migration
  def change
  	rename_column :characters, :behavior_primary, :behavior_primary_id
  	rename_column :characters, :behavior_secondary, :behavior_secondary_id
  end
end
