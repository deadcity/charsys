class CreateCharacterHasAttributes < ActiveRecord::Migration
  def change
    create_table :character_has_attributes do |t|
      t.integer :attribute_id
      t.integer :character_id

      t.timestamps null: false
    end
  end
end
