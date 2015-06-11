class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :user_id
      t.integer :lineage_id
      t.integer :affiliation_id
      t.string :sublineage
      t.string :behavior_primary
      t.string :behavior_secondary
      t.integer :size
      t.integer :defense
      t.integer :initiative_mod
      t.integer :armor
      t.integer :speed
      t.integer :power_stat
      t.integer :morality
      t.integer :health
      t.integer :willpower
      t.integer :max_resource

      t.timestamps null: false
    end
  end
end
