class AddBehaviorFieldsToCharacterType < ActiveRecord::Migration
  def change
  	add_column :character_types, :behavior_primary, :string
  	add_column :character_types, :behavior_secondary, :string
  end
end
