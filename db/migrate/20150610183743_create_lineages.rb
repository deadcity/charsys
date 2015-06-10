class CreateLineages < ActiveRecord::Migration
  def change
    create_table :lineages do |t|
      t.string :name
      t.integer :character_type_id

      t.timestamps null: false
    end
  end
end
