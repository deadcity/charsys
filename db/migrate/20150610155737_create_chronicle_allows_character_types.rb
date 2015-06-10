class CreateChronicleAllowsCharacterTypes < ActiveRecord::Migration
  def change
    create_table :chronicle_allows_character_types do |t|
      t.integer :chronicle_id
      t.integer :character_type_id

      t.timestamps null: false
    end
  end
end
